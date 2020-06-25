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
             var TxtName = $get("TxtName");
             TxtName.value = "";

             var TxtSurname = $get("TxtSurname");
             TxtSurname.value = "";

             var TxtBirthdate = $get("TxtBirthdate");
             TxtBirthdate.value = "";

             var TxtNumP = $get("TxtNumP");
             TxtNumP.value = "";

             var TxtNumA = $get("TxtNumA");
             TxtNumA.value = "";

             var TxtObs = $get("TxtObs");
             TxtObs.value = "";

         }