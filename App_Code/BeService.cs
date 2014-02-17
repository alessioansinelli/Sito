using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for BeService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class BeService : System.Web.Services.WebService {

    public BeService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }


    [WebMethod(EnableSession=true)]
    public List<Oggetti.Oggetto> PhotoGalleryList(string NomeUtente, string Password)
    {

        List<Oggetti.Oggetto> retVal = null;
        
        if (AutOK(NomeUtente, Password)){
            Notizie oNotizie = new Notizie(TipoOggetto.Photogallery);
            retVal = oNotizie.GetAll(0);            
        }
                
        return retVal;
    }

    private bool AutOK(string NomeUtente, string Password) {

        bool bRet = false;

        Oggetti.OggettoLogin oLogin = new Oggetti.OggettoLogin();
        oLogin.NomeUtente = NomeUtente;
        oLogin.PwdUtente = Password;

        Login loginUtil = new Login();

        if ((loginUtil.AutenticaUtente(oLogin).IdUtente) > 0) {
            bRet = true;
        }

        return bRet;

    }
    
}
