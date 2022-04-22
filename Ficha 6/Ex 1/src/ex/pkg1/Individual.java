package ex.pkg1;

import static java.lang.Math.random;
import java.util.Arrays;
import java.util.Random;

/**
 *
 * @author joaoc
 */
public class Individual {
    private double fitness;
    private char[] genes;
    

    public Individual(char[] chromossome) {
        this.genes = chromossome;
        this.fitness = -1;
    }

    public Individual(int lenght) {
        this.genes = new char[lenght];
        this.fitness = -1;
        this.generateChromossome();
    }

    private void generateChromossome() {
        for (int i = 0; i < this.genes.length; i++){
            this.genes[i] = this.randomChar();
        }
    }

    public char randomChar() {
        int hexchar = (int) (random() * (122 - 63)) +63;
        if (hexchar == 63){hexchar = 32;};
        if (hexchar == 64){hexchar = 46;}

        return (char) hexchar;
    }
    
    
    public double getFitness() {
        return fitness;
    }

    public void setFitness(double fitness) {
        this.fitness = fitness;
    }

    public char[] getGenes() {
        return genes;
    }
    
    public char getGene(int offset) {
        return this.genes[offset];
    }

    public void setGene(int offset, char gene) {
        this.genes[offset] = gene;
    }
    

    @Override
    public String toString() {
        return "Individual{" + "fitness=" + fitness + ", genes=" + Arrays.toString(genes) + '}';
    }
    
    
}
