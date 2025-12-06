resource "aws_ecr_repository" "vprofile_repo" {
  for_each             = toset(var.repository_names)
  name                 = each.key
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  
  # Cài đặt quét hình ảnh (Image Scanning)
  image_scanning_configuration {
    scan_on_push = true
  }

  # Cài đặt Mã hóa (Encryption) - Mặc định dùng AWS-managed key
  encryption_configuration {
    encryption_type = "AES256"
  }

}