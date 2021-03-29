<?php

$reply = ["hello" => "world", "headers" => getallheaders()];
$data = ["Wolverine" => "logan"];
header("Content-Type: application/json");
$headers = getallheaders();

echo "headers: "+implode(" ",$headers);

list($type, $bearer) = explode(" ", $headers["Authentication"]);

echo "type: "+$type;
echo "bearer: "+$bearer;

$dbconn = pg_connect("host=localhost port=5432 dbname=phpapp");
$result = pg_query($dbconn, "SELECT name FROM clients WHERE token=\'"+$bearer+"\';");
$rows = pg_num_rows($result);

if($type == "Bearer" && $rows == 1) {
  $reply = ["mutant" => $headers["X-Men"], "name"=> $data[$headers["X-Men"]]];
  if($reply["name"] == null)
    $reply["name"] = "Unknown";
} else {
  http_response_code(401);
  $reply = ["error"=>"Invalid token.", "token"=>$bearer, "type"=>$type];
}
echo json_encode($reply);

?>