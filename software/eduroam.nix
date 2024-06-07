{
	  networking.wireless = {
    		enable = true;
    		networks = {
      		eduroam = {
        		auth=''
          		proto=RSN
          		key_mgmt=WPA-EAP
          		eap=PEAP
          		identity="made00021@uni-saarland.de"
          		password=hash:3de1c933c546d56886d6e9f8ac5377ed
          		#domain_suffix_match="radius.htw-dresden.de"
          		domain_suffix_match="uni-saarland.de"
          		anonymous_identity="edu-roam-uni-saarland.de"
          		phase1="peaplabel=0"
          		phase2="auth=MSCHAPV2"
          		#ca_cert="/etc/ssl/certs/ca-bundle.crt"
          		ca_cert="/etc/ssl/certs/ca-bundle.crt"
        '';
      };
    };
  };
}
