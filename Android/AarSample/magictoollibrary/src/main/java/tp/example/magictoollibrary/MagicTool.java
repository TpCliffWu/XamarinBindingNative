package tp.example.magictoollibrary;

import android.util.Base64;
import android.widget.TextView;

import java.nio.charset.StandardCharsets;

public class MagicTool {

    // 回傳字串
    public String GetString() {
        return "Hello Magic!";
    }

    // 會傳陣列加總
    public int MathIntAdditionWithIntArray(int[] intArray) {
        int sum = 0;
        for (int i : intArray) {
            sum += i;
        }
        return sum;
    }

    // 回傳base64
   public String StringToBase64WithStr(String str){

       byte[] bdata = str.getBytes(StandardCharsets.UTF_8);
       String b64 = Base64.encodeToString(bdata, Base64.DEFAULT);
       return  b64;
   }

}
