package com.example.tareasesion10;

import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    //declarar variables tipo componentes
    private EditText et_dni,et_nombre,et_distrito, et_edad,et_telefono,et_email,et_sexo, et_ingresos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //asignar datos a las variables tipo componente
        et_dni=(EditText)findViewById(R.id.txtdni);
        et_nombre=(EditText)findViewById(R.id.txtnombre);
        et_distrito=(EditText)findViewById(R.id.txtdistrito);
        et_edad=(EditText)findViewById(R.id.txtedad);
        et_telefono=(EditText)findViewById(R.id.txttelefono);
        et_email=(EditText)findViewById(R.id.txtemail);
        et_sexo=(EditText)findViewById(R.id.txtsexo);
        et_ingresos=(EditText)findViewById(R.id.txtingresos);
    }
    public void registrar(View view){
        //crear un objeto de la base de datos
        datos admin=new datos(this,"bdcliente",null,1);
        //asignar permisos de escritura en la base de datos
        SQLiteDatabase basedatos=admin.getWritableDatabase();

        //agregar los valores de las variables tipo componente a las variables tipo string
        String xdni=et_dni.getText().toString();
        String xnombre=et_nombre.getText().toString();
        String xdistrito=et_distrito.getText().toString();
        String xedad=et_edad.getText().toString();
        String xtelefono=et_telefono.getText().toString();
        String xemail=et_email.getText().toString();
        String xsexo=et_sexo.getText().toString();
        String xingresos=et_ingresos.getText().toString();

        //agregar los datos en la base de datos mediante sentencias sql
        basedatos.execSQL("insert into cliente(dni,nombre,distrito,edad,telefono,email,sexo,ingresos) " +
                " values('"+xdni+"','"+xnombre+"','"+xdistrito+"' ,'"+xedad+"' ,'"+xtelefono+"','"+xemail+"','"+xsexo+"','"+xingresos+"')");

        //mostrar una notificación de la operación
        Toast.makeText( this,"se agrego un nuevo cliente", Toast.LENGTH_SHORT).show();
        //cerrar la base de datos
        basedatos.close();
    }

    public void consultar(View view) {
        //crear un objeto de la base de datos
        datos admin = new datos(this, "bdcliente", null, 1);
        //asignar permisos de escritura en la base de datos
        SQLiteDatabase basedatos = admin.getWritableDatabase();
        //agregar los valores de las variables tipo componente a las variables tipo string
        String xdni = et_dni.getText().toString();

        if(!xdni.isEmpty()){
            Cursor fila=basedatos.rawQuery("select * from cliente where dni='"+xdni+"'",null);
            if(fila.moveToFirst()){
                et_dni.setText(fila.getString( 0 ));
                et_nombre.setText(fila.getString(1 ));
                et_distrito.setText(fila.getString(2 ));
                et_edad.setText(fila.getString(3 ));
                et_telefono.setText(fila.getString(4));
                et_email.setText(fila.getString(5));
                et_sexo.setText(fila.getString(6));
                et_ingresos.setText(fila.getString(7));
                //mostrar una notificación
                Toast.makeText( this,"si existe el cliente", Toast.LENGTH_SHORT).show();
                //cerrar la base de datos
                basedatos.close();
            }
        }else{
            //mostrar una notificación
            Toast.makeText( this,"debe ingresar el dni", Toast.LENGTH_SHORT).show();
        }
    }

    public void actualizar(View view){
        datos admin = new datos(this, "bdcliente", null, 1);
        SQLiteDatabase basedatos = admin.getWritableDatabase();
        String xdni=et_dni.getText().toString();
        String xnombre=et_nombre.getText().toString();
        String xdistrito=et_distrito.getText().toString();
        String xedad=et_edad.getText().toString();
        String xtelefono=et_telefono.getText().toString();
        String xemail=et_email.getText().toString();
        String xsexo=et_sexo.getText().toString();
        String xingresos=et_ingresos.getText().toString();

        basedatos.execSQL("update cliente set nombre='"+xnombre+"', distrito='"+xdistrito+"', edad='"+xedad+"',telefono='"+xtelefono+"',email='"+xemail+"'," +
                "sexo='"+xsexo+"', ingresos='"+xingresos+"' where dni='"+xdni+"'");

        Toast.makeText( this,"se actualizo el cliente", Toast.LENGTH_SHORT).show();
        //cerrar la base de datos
        basedatos.close();
    }

    public void eliminar (View view){
        datos admin = new datos(this, "bdcliente", null, 1);

        SQLiteDatabase basedatos = admin.getWritableDatabase();

        String xdni= et_dni.getText().toString();

        basedatos.execSQL("delete from cliente   where dni='"+xdni+"'");

        Toast.makeText( this,"se elimino un cliente", Toast.LENGTH_SHORT).show();
        et_dni.setText("");
        et_nombre.setText("");
        et_distrito.setText("");
        et_edad.setText("");
        et_telefono.setText("");
        et_email.setText("");
        et_sexo.setText("");
        et_ingresos.setText("");

        basedatos.close();
    }
}


