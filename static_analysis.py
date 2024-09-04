# static_analysis.py
import os
from androguard.core.bytecodes.apk import APK

def analyze_apk(apk_path):
    # Load APK file
    apk = APK(apk_path)
    
    # Extract basic information
    app_name = apk.get_app_name()
    permissions = apk.get_permissions()
    
    # Print or log the information
    print(f"App Name: {app_name}")
    print("Permissions:")
    for perm in permissions:
        print(f"- {perm}")
    
    # Return collected data for further analysis
    return {
        "app_name": app_name,
        "permissions": permissions,
    }

# Example usage
apk_path = "path/to/your/app.apk"
analyze_apk(apk_path)
