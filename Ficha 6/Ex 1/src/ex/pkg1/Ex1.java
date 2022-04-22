package ex.pkg1;

import java.util.Random;

/**
 *
 * @author joaoc
 */
public class Ex1 {
    final static String TARGET = "IA e a melhor UC do curso.";
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int generation = 1;
        
        AlgGenetico g1 = new AlgGenetico(100, 0.01, 0.95, 3);
        Population population = g1.initPopulation(TARGET.length());
        g1.evalPopulation(population, TARGET);
        
        while (!g1.isTerminationConditionMet(population)){
            System.out.println("Gen ("+ generation + " best individual "+ population.getFittest(0).toString() + " Population Fitness: "+population.getPopulationFitness());
            population = g1.crossoverPopulation(population);
            population = g1.mutatePopulation(population);
            g1.evalPopulation(population, TARGET);
            generation++;
        }
        System.out.println("found a solution after "+ generation + " generation");
        System.out.println("Best solution " + population.getFittest(0).toString());
    }

}
