# Desafio de Estágio em DevOps - VExpenses

## 📌 Descrição do Projeto
Este repositório contém a solução para o **Desafio de Estágio em DevOps da VExpenses**. O desafio consiste na utilização de **Terraform** para provisionamento de infraestrutura na AWS, incluindo melhorias de segurança e automação da instalação do servidor **Nginx**.

## 📁 Estrutura do Repositório
- [`README.TASK1.md`](./README.TASK1.md) → Análise técnica do **código Terraform original**.
- [`README.TASK2.md`](./README.TASK2.md) → Explicação das **modificações** e melhorias implementadas.
- `variables.tf` → Definição de variáveis.
- `outputs.tf` → Saídas do Terraform.
- `Security_Group.tf` → Configuração do Grupo de Segurança AWS.
- `EC2_Instance.tf` → Configuração da instância EC2.
- `Network_Resources.tf` → Configuração da rede AWS.

## ⚙️ **Requisitos**
Antes de iniciar, certifique-se de ter instalado:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- Conta AWS configurada (com `aws configure` e credenciais no env)

## 🚀 **Como Executar o Projeto**
1. **Clone o repositório**
   ```sh
   git clone https://github.com/ryanzinhim/Teste-VEXPENSES.git
   cd Teste-VEXPENSES
   ```
2. **Inicialize o Terraform**
   ```sh
   terraform init
   ```
3. **Verifique o plano de execução**
   ```sh
   terraform plan
   ```
4. **Aplique as configurações**
   ```sh
   terraform apply -auto-approve
   ```
5. **Acesse a instância EC2 e verifique o Nginx**
   ```sh
   curl http://<IP_PÚBLICO_DA_EC2>
   ```

## 📖 Referências
- [Documentação Terraform](https://developer.hashicorp.com/terraform/docs)
- [Documentação AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

Qualquer dúvida, fique à vontade para entrar em contato! 🚀

