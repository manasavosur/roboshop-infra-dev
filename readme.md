### Bastion SSH Timeout (IP Change)

If Terraform or SSH fails with:

`dial tcp 10.x.x.x:22: i/o timeout`

It usually means my **public IPv4 changed**, and the Bastion Security Group still allows the **old IP**.

**Fix:**

```bash
cd 20-sg-rules
terraform apply
```

This updates the Security Group rule with my **current public IP**.
After that, re-run `terraform apply` in the folder where it failed.

**Note (Real Companies):**
This issue usually does **not happen in companies** because engineers access infrastructure through **VPN, corporate static IPs, bastion gateways managed centrally, or tools like AWS Systems Manager**
