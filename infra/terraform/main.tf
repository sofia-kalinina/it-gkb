module "vectorestore" {
    source = "./modules/vectorestore"
    
    vpc_id = "vpc-c951fda3" # replace by yours
    subnet_ids = ["subnet-5d970037","subnet-ece839a0"] # replace by yours

    tags = {
        "OwnedBy": "Terraform"
        "project": "IT-GKB"
    }  
}
