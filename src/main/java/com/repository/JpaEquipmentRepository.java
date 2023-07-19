package com.repository;
import com.model.Equipment;
import jakarta.persistence.*;

import java.util.List;
public class JpaEquipmentRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Equipment> getAllEquipment() {
        TypedQuery<Equipment> typedQuery = entityManager.createQuery("select e from Equipment e", Equipment.class);
        List<Equipment> equipmentList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return equipmentList.stream().sorted((firstE, secondE) -> ((Integer)firstE.getId()).compareTo((Integer)secondE.getId())).toList();
    }

    public String findEquipmentNameById(Integer id) {
        Equipment equipment = entityManager.find(Equipment.class, id);
        //entityManager.close();
        //emFactory.close();
        return equipment.getName();
    }
}
