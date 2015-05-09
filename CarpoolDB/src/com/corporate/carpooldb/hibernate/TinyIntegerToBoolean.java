package com.corporate.carpooldb.hibernate;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

public class TinyIntegerToBoolean implements UserType {

    public Object deepCopy(Object value) throws HibernateException {
        return value;
    }

    public Serializable disassemble(Object value) throws HibernateException {
        return (Serializable) value;
    }

    public Object assemble(Serializable cached, Object owner)
            throws HibernateException {
        return cached;
    }


    public boolean equals(Object x, Object y) throws HibernateException {
        if (x == null || y == null) {
            return false;
        } else {
            return x.equals(y);
        }
    }

    public int hashCode(Object x) throws HibernateException {
        assert (x != null);
        return x.hashCode();
    }
    

    /* boilerplate... */
    public boolean isMutable() {
        return false;
    }


    public int[] sqlTypes() {
        return new int[]{Types.TINYINT};
    }

    public Class returnedClass() {
        return Boolean.class;
    }
    
    public Object replace(Object original, Object target, Object owner)throws HibernateException {
    	return original;
    }

	@Override
	public Object nullSafeGet(ResultSet rs, String[] names, Object arg2)
			throws HibernateException, SQLException {
		  return (rs.getByte(names[0]) != 0);
	}

	@Override
	public void nullSafeSet(PreparedStatement st, Object value, int index)
			throws HibernateException, SQLException {
		st.setByte(index, Boolean.TRUE.equals(value) ? (byte) 1 : (byte) 0);
		
	}

   
}