node default{}
   node 'ip-172-31-95-181.ec2.internal'{
         include mysql
}
  node 'ip-172-31-85-141.ec2.internal'{
       include lamp
}

