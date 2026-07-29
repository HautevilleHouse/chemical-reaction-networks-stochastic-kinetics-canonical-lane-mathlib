import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure SmallWorldPackage where
  network : Type u
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  rewiringProbability : ℝ
  localConnectivity : Prop

structure SmallWorldEvidence (S : SmallWorldPackage) where
  highClusteringClosed : S.clusteringCoefficient > 0.5
  shortPathClosed : S.averagePathLength < 10.0

def SmallWorldClosed (S : SmallWorldPackage) : Prop :=
  S.clusteringCoefficient > 0.5 ∧ S.averagePathLength < 10.0

theorem small_world_closed_from_evidence (S : SmallWorldPackage)
    (E : SmallWorldEvidence S) : SmallWorldClosed S := by
  exact And.intro E.highClusteringClosed E.shortPathClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse