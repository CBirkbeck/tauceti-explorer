# Roadmap: analytic adic geometry required for diamonds

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

This component starts at the actual endpoint of AdicSpaces Layers 0–5. It supplies the geometric
operations used in ECD, not a competing definition of adic spaces. Perfectoid-specific theorems
are owned by PerfectoidSpaces; étale cohomology is owned elsewhere. References are Huber,
*Étale cohomology of rigid analytic varieties and adic spaces* (Hub96), ECD §§3, 5–6, 15, and the
local analytic results cited there from Kedlaya–Liu and Fargues–Scholze.

## A0. Completed tensor products and the fibre products actually used

**Canonical owner:** [AdicSpacesPartII](../AdicSpacesPartII/README.md), foundational prefix.
The following is the exact supplier contract and comparison test for this roadmap; the
constructions are proved once there. A0 is complete here when imports and natural comparison
maps establish this contract on the same adic carriers.

Construct the topology on a tensor product of compatible complete Huber pairs from rings of
definition and ideals of definition, its separated completion, and the plus subring obtained by
integral closure of the image of the tensor product of plus rings. Prove the universal property
for continuous morphisms of pairs. In the cases in which uniformization is necessary, construct
it and prove its universal property separately; a separated completion need not be uniform.
Track changes of rings of definition, pseudouniformizers, and plus rings.

First prove existence of pullbacks along rational open immersions and finite étale maps. Extend
to the locally finite-type/noetherian cases used in classical analytic geometry. The perfectoid
pullback theorem is proved in P2, using this algebra, rather than asserted for arbitrary sheafy
Huber pairs. A completed tensor formula alone is not a proof that its structure presheaf is a
sheaf. Glue affine constructions and prove the categorical pullback property, chart independence,
associativity and unit comparison maps, with their coherence.

Construct the analytic locus and morphism restriction interfaces required to apply these
constructions to analytic adic spaces over `Spa(ℤ_p,ℤ_p)`. Preserve non-Tate Huber pairs such
as Witt rings at the input, using Tate charts on their analytic loci.

**Tests:** rational pullback, a finite étale algebra, scalar extension of a Tate algebra, and
perfectoid scalar extension after P2. Do not infer pullbacks of all adic spaces from these cases.

## A1. Finite étale and étale geometry

The ordinary finite/étale morphism constructions in the next paragraph belong to
AdicSpacesPartII's early prefix. This milestone owns the site, geometric-point, basis/slice
comparison and generalized-adic-presentation constructions in the subsequent paragraphs.

For complete Tate Huber pairs, construct the topology on a finite étale algebra, its integral
plus ring, and its affinoid spectrum. Prove continuity, sheafiness in the required situations,
and compatibility with rational restriction. Define finite étale adic morphisms by this local
algebraic description, and étale morphisms by the local open-immersion/finite-étale description
appropriate to analytic adic spaces. Compare with Huber's definition in its original hypotheses.
Prove local-to-global recognition, base change, composition, and morphisms between étale
objects. Establish open images and the relevant diagonal descriptions.

Construct the small étale and finite étale categories and their topologies; prove the basis
comparison, slice-site descriptions, geometric stalks, and enough points. Keep field pairs
`(K,K⁺)`, including higher-rank integral valuation subrings, rather than testing only rank-one
points. These are geometric sites, not definitions of derived cohomology.

For the pro-étale extension use Scholze's corrected covering definition: arbitrary
transfinite towers whose successor-to-previous-limit maps are pullbacks of finite
étale surjections; the countable case is unchanged. An arbitrary open surjection
of profinite sets need not split. Do not import the deleted Proposition 3.8 or the
deleted final point claims of Proposition 3.13 from the uncorrected 2013 paper;
the coherent-topos enough-points assertion is separate. The underlying pro-étale
category remains unchanged. Source: the complete three-page
corrigendum.

Where Huber's general analytic category uses generalized adic-space presentations, implement
that presentation framework and prove its agreement with the sheafy adic spaces constructed
in AdicSpaces. This is the scope needed for ECD §15, not an assumption that every arbitrary
Tate pair is sheafy. Quotient/uniformization comparison of finite étale algebras belongs to A4.

## A2. Separatedness, smooth charts, and classical analytic geometry

**Canonical owner:** [AdicSpacesPartII](../AdicSpacesPartII/README.md). The following is the
required geometric supplier contract. This component proves compatibility of those
constructions with A1's sites; ClassicalAdicEtaleCohomology owns the derived comparisons.

Build diagonals, separated morphisms, proper and partially proper morphisms, valuative criteria,
and the comparison of these notions with Huber's definitions in the noetherian analytic scope.
Keep the hypotheses making the relevant fibre products exist. This classical properness API
is distinct from the later extension to small v-stacks.

Construct finite-dimensional analytic balls and tori, locally finite-type morphisms, continuous
Kähler differentials in the finite-presentation setting, the analytic Jacobian criterion, and
smooth morphisms. Prove that smooth morphisms are locally étale over a relative ball, the
base-change/composition statements, and dimension estimates. Prove these geometric facts by
analytic algebra, without using diamond cohomological smoothness. The general nonnoetherian
special case needed for ECD 6.4(iv) is A3, not an automatic consequence of this stage.

Supply the adic analytification of finite-type schemes over a nonarchimedean field and the
relative constructions over an affinoid pair. Supply formal schemes, admissible formal models
and their generic fibres in the scope required by H1. Their ordinary geometry, blowups and
comparison maps are explicit constructions; do not assume AdicSpaces already includes a
Raynaud equivalence. H1 owns the cohomological specialization/nearby-cycle constructions.

## A3. The nonnoetherian affinoid étale approximation input

**Inputs:** P2–P5 and Q4, plus A0–A2. **Consumers:** P6 and then the disconnected-cover construction.
This stage may not use diamonds, ECD 11.30, ECD 15.6, or six operations.

ECD Proposition 6.4(iv) uses the affinoid finite-stage assertion, stronger than descent of a
qcqs étale space. It cites Hub96 1.7.1, the pseudocoherent sheaf theory of KL16, and
Fargues–Scholze IV.4.19. A direct import of all of IV.4 is not a valid dependency: some proofs
there already use the diamond comparison being constructed here.

Prove the following analytic input in characteristic `p`, then transfer by tilting. Over an
affinoid perfectoid base, an affinoid étale object has the finite analytic presentation and
control of perturbations needed to approximate it by an affinoid étale object at a finite
stage. The proof consists of the following separate tasks.

1. Develop pseudocoherent modules over the relevant Tate algebras, strict exactness, completed
   localizations, and acyclic gluing on rational covers. Prove the required cases of KL16 rather
   than demanding all imperfect period rings.
2. Construct the requisite closed embedding into a finite relative ball and its ideal sheaf.
   For the étale source, prove the conormal description and locally finite generation by as
   many equations as ball variables, with invertible Jacobian.
3. Prove that this ideal sheaf is the sheaf of a pseudocoherent module; establish the affine
   quotient description and its plus-ring description. Prove the characteristic-`p`
   specialization of the local assertions used from FS IV.4.13, IV.4.15, IV.4.17 and IV.4.19
   by analytic algebra and pseudocoherent gluing, not by a diamond-locality theorem.
4. Establish quantitative nonarchimedean implicit-function/perturbation lemmas. Sufficiently
   close equations define an affinoid étale space; comparison maps are inverse after the
   permitted shrinking. Prove stability of the plus ring and affinoid presentation as well
   as the underlying étale object.
5. Approximate the finite equations, inequalities and Jacobian inverse at a finite stage, then
   use P5 to identify the resulting pullback with the original object. Make the independence
   of presentations explicit.

A proof of the general FS theorem is not required here; a proof of this special-case replacement
is. This is a substantial analytic-algebra milestone, not a one-line citation or an assumed
“affinoidness is local” lemma.

## A4. Analytic adic presentations for diamondification

Construct uniform completion of a Tate pair and prove invariance of its valuation spectrum
and the étale-category comparison needed in ECD 15.3–15.4. Construct the cofiltered system of
finite étale torsors with no remaining nonsplit finite étale covers. Prove that its uniform
completion is perfectoid, including the pseudouniformizer and Frobenius-surjectivity arguments.
Prove invariance and effectivity of the finite étale data along this process; do not infer
surjectivity of a v-sheaf from point-surjectivity without the compactness condition.

Provide the local analytic presentation used in §15: a perfectoid cover and its induced
perfectoid equivalence relation, or the corresponding generalized-affinoid presentation.
The actual sheaf `Spd(A,A⁺)`, its diamond representability and the proof that the analytic and
diamond étale sites agree are owned by D6. A4 must not call D6 to justify its analytic
finite-stage constructions.

## Public interface and completion

Export the relevant categories, local presentations, explicit base-change objects, their
universal properties, and natural comparison isomorphisms. For each operation give extensionality,
restriction, composition and identity lemmas, and exact hypotheses for affine formulas. Reuse
the AdicSpaces topological and sheaf carriers. Completion requires the nonnoetherian A3 theorem,
not merely its noetherian analogue, and the general analytic A4 presentation, not merely rigid
spaces over a field.

## Completion contracts added on 2026-09-15

**Applies to:** `A1`, `A3`, `A4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Split A3's perturbation proof into descent of the finitely many defining equations, descent of an inverse Jacobian determinant and inequalities, and proof that the resulting isomorphism preserves the integral plus ring. After shrinking at a finite stage prove the inverse maps agree on overlaps; this gives an affinoid finite-stage object rather than only a qcqs étale object. A4 must prove the torsor tower has the asserted uniform completion and finite-étale effectivity before diamondification.

### Producer–consumer contract

Export the finite-stage index and transition witness together with its base-change isomorphism, not only existence of an isomorphic object. The sites inherit the corrected transfinite covering convention from the cited corrigendum.

### Acceptance and source route

Test a rational annulus with nonmaximal plus ring and two presentations of one affinoid étale algebra; ensure no invocation of D6 or cohomological smoothness occurs in A3.

**Source route:** ECD 6.4(iv), 15.3–15.6; Hub96 1.7.1; KL16 pseudocoherent approximation; Scholze corrigendum. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
