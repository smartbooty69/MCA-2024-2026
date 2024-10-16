<?php

class Animal {
    protected $name;

    public function __construct($name) {
        $this->name = $name;
        echo "Animal '{$this->name}' created.<br>";
    }

    public function __destruct() {
        echo "Animal '{$this->name}' destroyed.<br>";
    }

    public function makeSound() {
        return "Some generic animal sound.";
    }
}

class Dog extends Animal {
    
    public function makeSound() {
        return "Woof! Woof!";
    }
}

class Cat extends Animal {
    
    public function makeSound() {
        return "Meow!";
    }
}

function animalSound(Animal $animal) {
    echo $animal->makeSound() . "<br>";
}

$dog = new Dog("Buddy");
$cat = new Cat("Whiskers");

animalSound($dog); 
animalSound($cat); 

unset($dog); 
unset($cat); 

?>
