 // call the function on pageload
         function pageLoad() {
             //Get the Modalpopupextender based on BehaviorID
             var mpe = $find("modalPopupExtender1");
             //Attach the clearvalues function to it
             mpe.add_shown(clearvalues);
         }
         //Function to clear the values
         //Add other control also here
var nombre = document.getElementById('txtNombre');
var apellido = document.getElementById('txtApellido');
var fechanac = document.getElementById('txtFechaNac');
var observaciones = document.getElementById('txtObservaciones');
var error = document.getElementById('error');
error.style.color = 'red';


function enviarFeligres() {
    var mensajesError = [];
    if (nombre == '') {
        mensajesError.push('Debe ingresar un nombre');
    }
    if (apellido == '') {
        mensajesError.push('Debe ingresar un apellido');
    }
    error.innerHTML = mensajesError.join(', ');
    
    return false;
}