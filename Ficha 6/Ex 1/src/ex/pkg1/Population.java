package ex.pkg1;

import java.util.Arrays;

/**
 *
 * @author joaoc
 */
public class Population {
    
    private Individual[] individuals;
    private double populationFitness;

    public Population(int populationSize) {
        this.individuals = new Individual[populationSize];
        this.populationFitness = 0;
    }
    
    public Population(int populationSize, int chromossomeLength) {
        this.individuals = new Individual[populationSize];
        this.generatePopulation(chromossomeLength);
    }

    public void setPopulationFitness(double populationFitness) {
        this.populationFitness = populationFitness;
    }
    
    private void generatePopulation(int chromossomeLength){
        for (int i = 0; i < this.individuals.length; i++){
            this.individuals[i] = new Individual(chromossomeLength);
        }
    }

    public Individual[] getIndividuals() {
        return individuals;
    }

    public double getPopulationFitness() {
        return populationFitness;
    }
    
    
    //Get the fittest individual
    public Individual getFittest(int offset) {
        Arrays.sort(this.individuals, (i1, i2) ->{
            if (i1.getFitness() > i2.getFitness()){
                return -1;
            } else if (i1.getFitness() < i2.getFitness()){
                return 1; 
            }
                return 0;
            }
        );
        return this.individuals[offset];
    }

    public void setIndividual(int offset, Individual individual){
        this.individuals[offset] = individual;
    }
    
    @Override
    public String toString() {
        return "Population{" + "individuals=" + Arrays.toString(individuals) + ", populationFitness=" + populationFitness + '}';
    }
    
}
