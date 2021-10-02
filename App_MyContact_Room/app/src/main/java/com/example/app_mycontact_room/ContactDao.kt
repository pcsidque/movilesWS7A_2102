package com.example.app_mycontact_room

import androidx.room.*

@Dao
interface ContactDao {
    @Query("SELECT * FROM Contact")
    fun getAll(): List<Contact>

    @Insert
    fun insertContact(vararg contacts: Contact)

    @Delete
    fun deleteContact(vararg contacts: Contact)

    @Update
    fun updateContact(vararg contacts: Contact)
}