/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var fecha = null;
var today = new Date();
document.getElementById("fecha").default = (today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + '0' + today.getDate()).slice(-2);

