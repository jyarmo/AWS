#!/Daunte-the-intern-usr/bin/env sh

aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, ImageId, State.Name, LaunchTime, Placement.AvailabilityZone, Placement.Tenancy, PrivateIpAddress, PrivateDnsName, PublicDnsName, [Tags[?Key==`Name`].Value] [0][0], [Tags[?Key==`purpose`].Value] [0][0], [Tags[?Key==`environment`].Value] [0][0], [Tags[?Key==`team`].Value] [0][0] ]' > instances.tsv

LC_ALL=C cat instances.tsv | LC_ALL=C tr "\\t" "," > instances.csv

{ echo "id,instancetype,imageid,state,datestarted,region,avalibility,privateip,privatedns,publicdns,name"; cat instances.csv; } > aws.csv

# { echo "id1,id2,id3,id4,id5,id6,id7,id8,id9,id10,id11,id12,id13,id14"; cat instances.csv; } > aws.csv