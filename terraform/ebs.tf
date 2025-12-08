# -------------------------
#  IAM Policy for EBS-CSI
# -------------------------
data "aws_iam_policy_document" "ebs_csi" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateSnapshot",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
      "ec2:ModifyVolume",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:CreateTags",
      "ec2:DeleteTags",
      "ec2:CreateVolume",
      "ec2:DeleteVolume"
    ]
    resources = ["*"]
  }
}
#tạo AmazonEBSCSIDriverPolicy một IAM policy có quyền như ebs_csi trên miêu tả
resource "aws_iam_policy" "ebs_csi" {
  name   = "AmazonEKS_EBS_CSI_Driver_Policy"
  policy = data.aws_iam_policy_document.ebs_csi.json
}

# -------------------------
# IAM Role for Addon
# -------------------------
data "aws_iam_policy_document" "ebs_csi_assume" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ebs_csi" {
  name               = "AmazonEKS_EBS_CSI_DriverRole"
  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume.json
}

resource "aws_iam_role_policy_attachment" "ebs_csi_attach" {
  role       = aws_iam_role.ebs_csi.name
  policy_arn = aws_iam_policy.ebs_csi.arn
}


