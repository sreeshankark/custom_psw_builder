# Copyright (C) 2023 CUSTOM PIXEL SETUP WIZARD BUILDER
# This file is a part of
#    
#    	  https://www.github.com/Sanju0910/custom_psw_builder
#   		 
#   Author: Sreeshankar K (https://www.github.com/Sanju0910)
#
clear;
echo -e "########################################################################################";
echo -e "##   \e[1;35mCUSTOM PIXEL SETUP WIZARD OVERLAY BUILDER FOR PIXEL BASED AOSP ROM DEVELOPMENT\e[0m   ##";
echo -e "##                           \e[1;36mSPOOF PIXEL SETUP WIZARD !\e[0m                               ##";
echo -e "##      \e[1;32mBuild custom named welcome screen and setup wizard for your AOSP ROM\e[0m          ##";
echo -e "##                                                                                    ##";   
echo -e "########################################################################################";
get_var(){
echo -e "\e[1;36m";
	read -p "Enter Your Device Manufacturer Name (eg: OnePlus): " BRAND;
		echo -e "";
			read -p "Enter Your Device Name (eg: OnePlus Nord): " DEVICE;
				echo -e "";
			read -p "Enter Your Custom ROM Name(eg: Pixel Experience): " ROM;
			echo -e "";
		echo -e "\e[0m";
}
clean_out(){
local OUT_DIR=out/PixelSetupWizardResTarget/res;
	rm -rf $OUT_DIR;
	mkdir -p $OUT_DIR;
}
backup_res(){
local TMP_DIR=.tmp;
local TAR_DIR=res;
	mkdir -p $TMP_DIR;
	cp -r $TAR_DIR/* $TMP_DIR;
	cp -r "$TAR_DIR/.zmisc" "$TMP_DIR/.zmisc";
}
sleep 0.5;
swap_name(){
local RES_DIR=res/values*;
echo -e "\e[0m* \e[1;31mGenerating\e[0m \e[1;32mresource\e[0m \e[1;31mfiles...\e[0m";
sleep 5;
echo " ";
	find $RES_DIR -type f -exec sed -i "s/ROM_NAME/$ROM/g" {} +;
		find $RES_DIR -type f -exec sed -i "s/DEVICE_NAME/$DEVICE/g" {} +;
	find $RES_DIR -type f -exec sed -i "s/BRAND_NAME/$BRAND/g" {} +;
find $RES_DIR -type f -exec sed -i "s/This file is a part of/This file is generated using/g" {} +;
sed -i "s/This file is a part of/This file is generated using/g" res/.zmisc/Android.bp;
sed -i "s/This file is a part of/This file is generated using/g" res/.zmisc/AndroidManifest.xml;
}
swap_name_exp(){
VALEXP=res/values-ar-rXB/strings.xml;
VALEXP_STR1=$ROM
VALEXP_STR2=$BRAND
STRLEN1=${VALEXP_STR1}
STRLEN2=${VALEXP_STR2}
reverse_name(){
	for ((i = $STRLEN1 - 1; i >= 0; i--))
		do
		REVERSE1="$REVERSE1${string:$i:1}";
	done
		for ((i = $STRLEN2 - 1; i >= 0; i--))
			do
			REVERSE2="$REVERSE2${string:$i:1}";
		done	
}
		sed -i "s/EMAN_MOR/$REVERSE1/g" "$VALEXP";
	sed -i "s/EMAN_DNARB/$REVERSE2/g" "$VALEXP";
}
copy2out(){
local TAR_DIR=res;
local OUT_DIR=out/PixelSetupWizardResTarget;
echo -e "\e[0m* \e[1;31mGenerating\e[0m \e[1;32mAndroid.bp\e[0m \e[1;31mfile...";
	cp $TAR_DIR/.zmisc/Android.bp $OUT_DIR/Android.bp;
echo " ";
sleep 2;
echo -e "\e[0m* \e[1;31mGenerating\e[0m \e[1;32mAndroidManifest.xml\e[0m \e[1;31mfile...";
sleep 1;
echo " ";
echo -e "\e[1;35mNAME = \e[1;36mPixelSetupWizardOverlay";
sleep 1;
echo -e "\e[1;35mPACKAGE = \e[1;36mcom.google.android.pixel.setupwizard.strings.overlay\e[0m";
sleep 1;
echo -e "\e[1;35mTARGET NAME = \e[1;36mPixelSetupWizard";
sleep 1;
echo -e "\e[1;35mTARGET PACKAGE = \e[1;36mcom.google.android.pixel.setupwizard\e[0m";
sleep 1;
	cp $TAR_DIR/.zmisc/AndroidManifest.xml $OUT_DIR/AndroidManifest.xml;
sleep 1;
echo " ";
	cp -r $TAR_DIR $OUT_DIR;
	rm -rf $OUT_DIR/res/.zmisc;
echo " ";
echo -e "\e[1;32mDone\e[0m";
echo " ";
sleep 0.1;
echo -e "        ***********************************************************************";
echo -e "        *                          \e[1;35mCONGRATULATIONS !                          \e[0m*";
echo -e "        *\e[1;32m               YOUR CUSTOM PIXEL SETUP WIZARD IS READY !             \e[0m*";
echo -e "        ***********************************************************************";
echo " ";
sleep 0.1;
echo -e "\e[1;36mWhat's next?";
sleep 0.1;
echo -e "\e[0m- \e[1;32mCopy your \e[1;31mCustom 'PixelSetupWizardResTarget' \e[1;32mfolder from \e[1;31mout\e[0m \e[1;32mfolder\e[0m";
sleep 0.1;
echo -e "\e[0m- \e[1;32mPaste it in your device tree inside \e[1;31m'overlay' \e[1;32mfolder";
sleep 0.1;
echo -e "\e[0m- \e[1;32mOpen \e[1;31m'device.mk' \e[1;32mfile";
sleep 0.1;
echo -e "\e[0m- \e[1;32mAdd these lines to your \e[1;31m'device.mk' \e[1;32mfile\e[0m";
sleep 0.1;
echo " ";
echo -e "	# Pixel Setup Wizard: Overlay";
sleep 0.1;
echo -e '	PRODUCT_PACKAGES += \';
sleep 0.1;
echo -e " 		PixelSetupWizardResTarget";
sleep 0.1;
echo " ";
sleep 0.1;
echo -e "\e[0m- \e[1;32mYour are ready to go...\e[0m";
    	
}
back2original(){
local TMP_DIR=.tmp;
local TAR_DIR=res;
	rm -rf $TAR_DIR;
	mkdir -p $TAR_DIR;
	cp -r $TMP_DIR/* $TAR_DIR;
	cp -r "$TMP_DIR/.zmisc" "$TAR_DIR/.zmisc";
	rm -rf $TMP_DIR;
}
conclude(){
echo " ";
sleep 0.1;
echo -e "        ***********************************************************************";
echo -e "        *\e[1;36m                  Tool developed by Sreeshankar K                    \e[0m*";
echo -e "        *\e[1;31m                Github: https://github.com/Sanju0910                 \e[0m*";
echo -e "        *                                                                     *";
echo -e "        *\e[1;36m       If you like this tool, consider donating for my projects      \e[0m*";
echo -e "        *\e[1;31m               PAYPAL: https://paypal.me/SreeshankarK                \e[0m*";
echo -e "        *                                                                     *";
echo -e "        ***********************************************************************";
}
get_var;
clean_out;
backup_res;
swap_name;
swap_name_exp;
copy2out;
back2original;
conclude;
exit 0;
