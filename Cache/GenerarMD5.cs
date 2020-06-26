using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Threading.Tasks;

namespace Cache
{
    public static class GenerarMD5
    {
        public static string crearMD5(string clave)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(clave));
            byte[] resultado = md5.Hash;
            StringBuilder str = new StringBuilder();
            for (int i = 1; i < resultado.Length; i++)
            {
                str.Append(resultado[i].ToString("x2"));
            }
            return str.ToString();
        }
    }
}
