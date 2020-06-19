using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace EN
{
 
    public class EN_Users
    {
        public int Id { get; set; }
        public string Nick { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string UserType { get; set; }



        //public int Id { get => Id; set => Id = value; }
        //public string Nick { get => Nick; set => Nick = value; }
        //public string Password { get => Password; set => Password = value; }
        //public string Name { get => Name; set => Name = value; }
        //public string Surname { get => Surname; set => Surname = value; }
        //public string UserTypeId { get => UserTypeId; set => UserTypeId = value; }
    }
}
