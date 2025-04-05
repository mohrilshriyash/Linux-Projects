## set permissions

set_permissions()
{
        read -p "enter the username to set permissions for: " username
        read -p "Enter the directory path: " directory
        read -p "Enter permissions(777,400 etc): " permissions

        # checking if directory exitsts
        if [ -d "$directory" ]; then
                sudo chmod "$permissions" "$directory"
                sudo chown "$username:$username" "$directory"
                echo  "Permissions set to $permissions for directory $directory and ownership changed to $username"
        else
                echo "Directory $directory does not exist."
        fi
}


### Main Menu

while true;
 do
        echo "================================="
        echo "User Management Menu"
        echo "================================= "
        echo "1.Create a new user"
        echo "2.Add a new user to group"
        echo "3.Set permissions on a directory"
        echo "4. Exit"

        read  -p "Enter your choice: " choice


        case "$choice" in
                1) create_user ;;
                2) add_user_to_group ;;
                3) set_permissions ;;
                4) echo  "Exiting ..."; break ;;
                *) echo "Invalid option please try again." ;;
        esac
 done
