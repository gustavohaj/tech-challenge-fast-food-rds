# Migração de Banco de Dados MySQL para AWS RDS com Terraform

Este projeto demonstra a migração de um banco de dados MySQL rodando em um `StatefulSet` no Kubernetes para uma instância gerenciada no AWS RDS, provisionada via Terraform.

## Arquitetura

A solução consiste em duas partes principais:

1.  **Infraestrutura AWS (Terraform):**
    *   **VPC:** Rede isolada para os recursos.
    *   **Subnets:** Subnets privadas para o RDS para garantir que ele não seja exposto à internet.
    *   **Security Group:** Firewall que controla o acesso ao RDS, permitindo tráfego na porta 3306.
    *   **AWS RDS for MySQL:** Instância de banco de dados gerenciada.
    *   **AWS Secrets Manager:** Armazenamento seguro da senha do banco de dados.

2.  **Kubernetes:**
    *   O `StatefulSet` original do MySQL é desativado.
    *   Um `Service` do tipo `ExternalName` é criado para apontar o nome de serviço interno (`mysql.desafio-fiap`) para o endpoint do RDS na AWS.
    *   A aplicação se conecta ao serviço do Kubernetes, que a redireciona para o banco de dados externo.

## Pré-requisitos

*   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) instalado.
*   [AWS CLI](https://aws.amazon.com/cli/) instalado e configurado com credenciais válidas.
*   [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) instalado e configurado para seu cluster.

## Como Implantar

### Fase 1: Provisionar a Infraestrutura AWS

1.  **Inicialize o Terraform:**
    ```bash
    terraform init
    ```

2.  **Planeje a implantação:**
    ```bash
    terraform plan
    ```

3.  **Aplique as mudanças:**
    Revise o plano e, se estiver correto, aplique-o.
    ```bash
    terraform apply
    ```

    Após a conclusão, o Terraform exibirá os outputs, como `rds_endpoint`, `rds_port` e `rds_password_secret_name`.

### Fase 2: Atualizar o Kubernetes

1.  **Obtenha o endpoint do RDS** do output do Terraform.

2.  **Atualize o manifesto do serviço Kubernetes** (`k8s/mysql-service.yaml`) para usar o tipo `ExternalName` e aponte para o endpoint do RDS.

3.  **Remova o `StatefulSet`** do MySQL do seu cluster:
    ```bash
    kubectl delete statefulset mysql -n desafio-fiap
    ```

4.  **Aplique o novo serviço:**
    ```bash
    kubectl apply -f k8s/mysql-service.yaml
    ```

Sua aplicação agora se conectará ao banco de dados na AWS sem precisar de alterações no código-fonte.

## CI/CD com GitHub Actions

O workflow em `.github/workflows/main.yml` automatiza o processo de `plan` e `apply` do Terraform a cada push para a branch `main`.

**Importante:** Para que o workflow funcione, você deve configurar os seguintes segredos no seu repositório GitHub:
*   `AWS_ACCESS_KEY_ID`
*   `AWS_SECRET_ACCESS_KEY`
