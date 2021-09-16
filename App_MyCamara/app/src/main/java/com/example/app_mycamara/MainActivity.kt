package com.example.app_mycamara

import android.Manifest
import android.content.pm.PackageManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {

    private val  CAMERA_REQUEST_CODE=0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val bt_camera = findViewById<Button>(R.id.bt_camera)

        bt_camera.setOnClickListener {
            checkCameraPermission()
        }
    }

    private fun checkCameraPermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)
        != PackageManager.PERMISSION_GRANTED)
        {
            //true
            //permiso rechazado
            requestCameraPermission()
        }
        else{
            Toast.makeText(this, "Ya tienes permiso a la Camara!!!", Toast.LENGTH_LONG).show()
        }
    }

    private fun requestCameraPermission() {
        //Determino si el usuario ya rechazo el permiso antes
        if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA))
        {
            Toast.makeText(this, "Rechazaste la solicitud de permiso. Habilítalo manualmente", Toast.LENGTH_LONG).show()
        }
        else{
            //El usuario nunca ha solicitado permiso
            Toast.makeText(this, "Acepta el permiso a la Camara!!!", Toast.LENGTH_LONG).show()
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA), CAMERA_REQUEST_CODE)
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode){
            CAMERA_REQUEST_CODE ->{
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED)
                {
                    //permiso aceptado
                    Toast.makeText(this, "Se autorizó permiso a la Camara!!!", Toast.LENGTH_LONG).show()
                    //Aqui hago la funcionalidad requerida...
                }
                else{
                    //permiso negado
                    Toast.makeText(this, "Permiso negado a la Camara!!!", Toast.LENGTH_LONG).show()
                    //podriamos desactivar la funcionalidad / mostrar un dialogo, etc
                }
                return
            }
        }
    }
}