 // call the function on pageload
         function pageLoad() {
             //Get the Modalpopupextender based on BehaviorID
             var mpe = $find("modalPopupExtender1");
             //Attach the clearvalues function to it
             mpe.add_shown(clearvalues);
         }
         //Function to clear the values
         //Add other control also here
         function clearvalues() {
             var txtNombre = $get("txtNombre");
             txtNombre.value = "";

             var txtApellido = $get("txtApellido");
             txtApellido.value = "";

             var txtFechaNac = $get("txtFechaNac");
             txtFechaNac.value = "";

             var txtNum1 = $get("txtNum1");
             txtNum1.value = "";

             var txtNum2 = $get("txtNum2");
             txtNum2.value = "";

             var txtObservaciones = $get("txtObservaciones");
             txtObservaciones.value = "";

         }