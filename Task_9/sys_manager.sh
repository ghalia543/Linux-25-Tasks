#!/bin/bash


show_system_info() {
  echo "Current User: $(whoami)"
}


check_permissions() {
  echo "Enter the filename: "
  read filename
  if [ -f "$filename" ]; then
    perms=$(ls -l "$filename" | awk '{print $1}')
    echo "Permissions for $filename: $perms"
  else
    echo "File not found!"
  fi
}


change_permissions() {
  echo "Enter the filename: "
  read filename
  echo "Enter new permission (e.g., 755): "
  read permission
  chmod $permission "$filename"
  echo "Permissions changed successfully."
}


compress_file() {
  echo "Enter the file/directory name: "
  read file_dir
  echo "Choose compression type: "
  echo "1. tar.gz"
  echo "2. zip"
  read choice
  if [ $choice -eq 1 ]; then
    tar -czf "$file_dir.tar.gz" "$file_dir"
    echo "Compression successful: $file_dir.tar.gz created."
  elif [ $choice -eq 2 ]; then
    zip -r "$file_dir.zip" "$file_dir"
    echo "Compression successful: $file_dir.zip created."
  else
    echo "Invalid choice!"
  fi
}


decompress_file() {
  echo "Enter the compressed file name: "
  read compressed_file
  if [ -f "$compressed_file" ]; then
    if [[ $compressed_file == *.tar.gz ]]; then
      tar -xzf "$compressed_file"
      echo "Decompression successful."
    elif [[ $compressed_file == *.zip ]]; then
      unzip "$compressed_file"
      echo "Decompression successful."
    else
      echo "Unsupported file format!"
    fi
  else
    echo "File not found!"
  fi
}

while true; do
  echo "========== Linux System Manager =========="
  echo "1. Show System Information"
  echo "2. Check File Permissions"
  echo "3. Change File Permissions"
  echo "4. Compress a File/Directory"
  echo "5. Decompress a File"
  echo "6. Exit"
  echo "=========================================="
  echo "Enter your choice: "
  read choice

  case $choice in
    1)
      show_system_info
      ;;
    2)
      check_permissions
      ;;
    3)
      change_permissions
      ;;
    4)
      compress_file
      ;;
    5)
      decompress_file
      ;;
    6)
      echo "Exiting the system manager. Goodbye!"
      break
      ;;
    *)
      echo "Invalid choice. Please enter a number between 1 and 6."
      ;;
  esac
done
