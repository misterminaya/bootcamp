package com.example.tareasesion10;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

public class datos extends SQLiteOpenHelper {

    public datos (@Nullable Context context, @Nullable String name, @Nullable SQLiteDatabase.CursorFactory factory, int version){
        super(context, name, factory, version);
    }

    @Override

    public void onCreate(SQLiteDatabase bdcliente){

        bdcliente.execSQL("create table cliente(dni text primary key, nombre text,distrito text, edad int,telefono text, email text, sexo text, ingresos money)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion){

    }
}
