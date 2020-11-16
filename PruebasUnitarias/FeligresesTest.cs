using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using EN;
using DAL;
using BL;
using System.Data.SqlClient;
using System.Configuration;

namespace PruebasUnitarias
{
    [TestClass]
    public class FeligresesTest
    {
        [TestMethod]
        public void DocumentoYaExistente()
        {
            var feligres = new EN_Feligres();
            var validarDocumento = new BL_Feligres();
            feligres.Tabla = "Feligres";
            feligres.Documento = "13579123";
            var resultado = validarDocumento.ValidarDocumento(feligres);

            Assert.IsTrue(resultado);
        }
    }
}