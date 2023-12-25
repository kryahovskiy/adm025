provider "yandex" {
  token    = var.yc_token
  cloud_id = var.cloud_id
  # folder_id не указываем, так как каталог создается тераформом сам
}