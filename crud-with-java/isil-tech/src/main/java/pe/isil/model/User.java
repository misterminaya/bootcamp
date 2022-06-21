package pe.isil.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {

    private Integer id;
    private String firstName;
    private String lastNameFather;
    private String lastNameMother;
    private Integer age;
}

