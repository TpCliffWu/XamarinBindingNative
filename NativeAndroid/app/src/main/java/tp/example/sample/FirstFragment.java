package tp.example.sample;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.util.Base64;

import java.nio.charset.StandardCharsets;


import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import tp.example.magictoollibrary.MagicTool;


public class FirstFragment extends Fragment {

    private TextView helloText;
    private TextView sumText;
    private TextView base64Text;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {
        View root = inflater.inflate(R.layout.fragment_first, container, false);

        MagicTool magic = new tp.example.magictoollibrary.MagicTool();

        String str = magic.GetString();

        helloText = (TextView) root.findViewById(R.id.textview_first_1);
        helloText.setText(str);


        int[] intArray = {1, 2, 3, 4, 5};
//        int sum = 0;
//        for (int i : intArray) {
//            sum += i;
//        }
        int sum =magic.MathIntAdditionWithIntArray(intArray);

        sumText = (TextView) root.findViewById(R.id.textview_first_2);
        sumText.setText(String.valueOf(sum));


//        byte[] bdata = str.getBytes(StandardCharsets.UTF_8);
//        String b64 = Base64.encodeToString(bdata, Base64.DEFAULT);

        String b64 =magic.StringToBase64WithStr(str);

        base64Text = (TextView) root.findViewById(R.id.textview_first_3);
        base64Text.setText(b64);


        // Inflate the layout for this fragment
        return root;
    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        view.findViewById(R.id.button_first).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                NavHostFragment.findNavController(FirstFragment.this)
                        .navigate(R.id.action_FirstFragment_to_SecondFragment);
            }
        });
    }
}