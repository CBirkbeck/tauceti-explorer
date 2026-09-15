# Roadmap: p-adic local Langlands for GL₂(Q_p)

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the local p-adic representation theory required by the stronger lifting theorems used in the Dieulefait–Pacetti proof. This is an additional modern development, not a dependency that is silently attributed to the classical Taylor–Wiles patching theorem.

## Existing material and ownership

R06 supplies local period theory, R08 local deformation rings, R16 characteristic-zero smooth local Langlands, and R03 the relevant commutative algebra. General Banach-space and topological-module theory must be checked against Mathlib and extended where absent. The correspondence here is specifically for GL₂(Q_p); no general correspondence for GL₂(K) is inferred for other p-adic fields.

## Conventions

Distinguish smooth mod-p representations, unitary admissible Banach representations and locally analytic representations. State topology, admissibility, central character and duality on each category. Normalisations of the Galois functor and the determinant/central character relation are fixed by comparison with R16/R01.


<a id="r30-1"></a>

## R30.1. Robba rings and (φ,Γ)-modules

**Milestone:** `R30.1`

Import analytic Robba foundations from PadicHodgeTheory P7:annulus-foundations and the étale equivalence, overconvergence and Herr comparison from PhiGammaModulesAndIwasawaCohomology PG.0–PG.3. Fix the GL₂(Q_p) covariance convention and prove the normalization bridge with R16.3 before applying Colmez. No second Robba ring or (φ,Γ)-module carrier is constructed.

**Dependencies:** GL2AutomorphicRepresentationsAndTransfer R16.3; PhiGammaModulesAndIwasawaCohomology PG.0–PG.3.

<a id="r30-2"></a>

## R30.2. The local representation categories

**Milestone:** `R30.2`

Construct the smooth mod-p, admissible unitary Banach and locally analytic categories for GL₂(Q_p), their duals and completed group-algebra actions. Prove the finiteness and compactness results needed for projective envelopes and deformation-theoretic endomorphism rings. Establish the mod-p classification in every residual characteristic used by R32, including exceptional low-characteristic blocks.

**Dependencies:** R30.1 (preceding layer).

<a id="r30-3"></a>

## R30.3. Colmez's construction

**Milestone:** `R30.3`

Construct the functor from two-dimensional (φ,Γ)-modules to representations and the associated Galois functor in the source's direction. Prove functoriality, exactness where valid, compatibility with determinant/central character and the prescribed irreducibility statements. The construction must not define the representation as an object already assumed to satisfy the desired correspondence.

**Dependencies:** R30.2 (preceding layer).

<a id="r30-4"></a>

## R30.4. Locally algebraic vectors and classical compatibility

**Milestone:** `R30.4`

Identify the locally algebraic vectors attached to de Rham representations with distinct integral Hodge weights and compare them with classical smooth local Langlands and the algebraic weight. Prove the nonvanishing and density/closure assertions used in modularity lifting with their full hypotheses. Hodge–Tate weights alone do not determine a p-adic Banach representation.

**Dependencies:** R30.3 (preceding layer).

<a id="r30-5"></a>

## R30.5. Blocks, projective envelopes and deformation rings

**Milestone:** `R30.5`

Construct the projective envelopes and prove their endomorphism-ring comparison with the appropriate local deformation or pseudodeformation rings. Establish the support and multiplicity statements used in the local Breuil–Mézard results. Treat absolutely irreducible, reducible and exceptional blocks separately, and identify where small p requires a distinct theorem.

**Dependencies:** R30.4 (preceding layer).

<a id="r30-6"></a>

## R30.6. The local results consumed by modern lifting

**Milestone:** `R30.6`

Extract and prove the precise Paškūnas, Hu–Tan and Tung statements needed by R32, including the dyadic and p=3 cases. Supply a theorem-hypothesis table rather than one unqualified “p-adic local Langlands theorem”. All results here remain local; their occurrence inside global completed cohomology is the additional theorem of R31.

| Source branch | Required scope and application fence |
| --- | --- |
| Paškūnas 2015 | p≥5 and scalar endomorphisms of the residual representation; its deformation/block comparison is not a theorem for every residual block. |
| Hu–Tan 2015 | p≥5; supplies the split/non-scalar-endomorphism cases excluded by the earlier Kisin/Paškūnas hypotheses, with the actual characters and block retained. |
| Tung 2021a | The p=3 modularity-lifting input selected by Dieulefait–Pacetti; keep its block and globalisation hypotheses distinct from Hu–Tan's p≥5 theorem. |
| Paškūnas 2016 plus Tung 2021b | The separate p=2 deformation/local–global route used by Dieulefait–Pacetti; neither odd-prime trace-zero splitting nor Emerton's p>2 promodularity theorem supplies this case. |

This table records the verified case division in Dieulefait–Pacetti's introduction, not permission to erase the individual theorem hypotheses. At each application R32 records the exact residual type, determinant, coefficient field and theorem number; the full exceptional-block proofs remain R30.5–R30.6 construction targets.

**Dependencies:** R30.5 (preceding layer).

## Required examples and checks

Check a crystalline two-dimensional representation with distinct Hodge weights, a trianguline example, and an exceptional mod-p block. Verify that the construction does not claim a GL₂(K) correspondence when K≠Q_p.



## References

COLMEZ10, PASKUNAS15, PASKUNAS16, HU_TAN15, TUNG21. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Local categories and exceptional blocks

**Stages:** R30.1, R30.2, R30.3, R30.4, R30.5, R30.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Specify the coefficient field and category on both sides of Colmez: étale (φ,Γ)-modules, continuous Galois representations, unitary admissible Banach representations, and their lattices. Construct the functors and their inverse/comparison maps; locally algebraic vectors are a later theorem with distinct Hodge weights.

**Acceptance and consumer contract.** Keep p≥5, p=3 and p=2 block/deformation theorems as separate rows with exact character, endomorphism and determinant assumptions. Verify a trianguline object and an exceptional residual block, including central-character normalization. A globalisation used only in a local–global application is recorded there; it does not become an unmentioned hypothesis of the local category equivalence.

## Source anchors and prototype coverage

- PadicLocalLanglandsForGL2Qp source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
