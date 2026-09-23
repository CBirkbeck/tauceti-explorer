# Liu–Wang: extraction after independent review

**Partial extraction; review requests revision.** The paper computes local-field TC through relative THH, Hopf-algebroid descent and refined algebraic spectral sequences, including the ramified two-primary case. The revised extraction has 90 items: 8 library, 15 planned and 67 missing. Every missing item has exactly one owner route. No formalisation or Lean compilation is claimed.

The independently read source is [arXiv2012.15014v4](https://arxiv.org/pdf/2012.15014v4), all 65 pages including AppendixA and references. Eight page images and selected TeX formulas were checked. The main journal PDF endpoint returned an HTML challenge, so findings are certified in v4 only. The [publisher correction](https://link.springer.com/content/pdf/10.1007/s00222-022-01147-4.pdf) corrects affiliations only. Prior worker reading claims are separately attributed in the JSON.

The source has a false δ-ring product law and an unbalanced graded tensor formula. More seriously, its binomial expansion gives the wrong sign for δ(z0−z1), which propagates into the Frobenius formulas; Lemma8.13 then uses the opposite sign. The extraction now corrects the local identities and labels the proposed global differential repair as an open proof target. The zero-charge and e=1 initial-page cases, counit at1, filtration order and the α-index interval are also repaired. These problems do not constitute a counterexample to the final additive TC group descriptions.

The library search found reusable foundations missed by the original extraction: Tau Ceti coalgebra comodules and their cofree adjunction; Mathlib divided powers, divided-power algebra, finite cyclic Hilbert90, Frobenius fixed-field/generator facts, rank-nullity and algebraic spectral-sequence pages. The remaining distinct-unit Hopf-algebroid Ext and convergence interfaces are not provided by those carriers. Ten relevant Lean blobs were verified at the prescribed pins.

Relative cyclotomic constructions now use RT.2; the BMS computation uses RT.6; PD envelopes use CR.0; δ-rings use PR.0; complete filtered algebra uses DD.1, importing the existing DGAInfinity graded tensor direction. Generic Adams/Hopf-algebroid descent is separated from the local calculation. The conjectural Cartier–Witt/motivic comparisons remain predicates. The previously omitted §9 trace cokernel and comparison obligations are recorded.

## Routes

| Route | Owner | Verdict | Reason |
|---|---|---|---|
| 1 | RefinedTraceMethods | accept | Generic relative THH/cyclotomic mathematics belongs to RT.2; the bounded-below comparison is corrected and the spherical Witt primary supplier remains explicit. |
| 2 | RefinedTraceMethods | accept | The regular-quotient algebraic HH/HP comparison belongs to RT.1, importing the common PD, Koszul and completion owners. |
| 3 | KTheoryFiniteLocalFields | reject | L.5 is the correct existing owner, but the alternative odd-prime proof of item002 depends on the unresolved sign chain. Preserve the planned status and existing classical target; do not ingest this route as a certified alternative proof yet. |
| 4 | RefinedTraceMethods | accept | The BMS relative computation and fixed-u_Fp normalization belong to RT.6. The base-change direction and normalization are correctly stated. |
| 5 | CrystallineCohomology | accept | CR.0 owns envelopes; the existing divided-power structures/algebra are separated and imported. |
| 6 | PrismaticCohomology | accept | PR.0 owns the corrected δ-ring law and torsionfree Frobenius-lift equivalence. |
| 7 | DerivedDeRhamCohomology | accept | DD.1 owns complete filtered algebra and mixed topology. The graded tensor direction is imported from DGAInfinity rather than duplicated; the false domain claim is corrected. |
| 8 | StableHomotopyKTheory | accept | H.6 is the shared coefficient/Bockstein/convergence owner; record the two-primary self-map/extension input explicitly. Source routing is not a claim the full supplier is proved. |
| 9 | KTheoryFiniteLocalFields | accept | L.5 needs this finite-field TC linear-algebra adapter. Its proof from pinned multiplicative Hilbert90, Frobenius and rank-nullity avoids a new generic additive-Hilbert90 development. |
| 10 | MotivicEtaleKTheory | accept | The norm-residue, motivic and étale comparison targets already belong to M.5/M.6/M.7. The source pictures are not used as proofs. |
| 11 | RefinedTraceMethods | accept | The precise degree−1 λ cokernel is a trace-comparison target for RT.3. Its unproved source assertion is retained as OPEN-TRACE with the required connective comparison contract. |
| 12 | StableHomotopyKTheoryPartIIHopfAlgebroidDescent | reject | The generic supplier must be separated from local TC, but the flatness, complete comodule-category and Ext/Adams contracts are not sufficiently closed to issue an accepted design brief. Reconcile the existing graded and cofree APIs first. |
| 13 | RefinedTraceMethodsPartIIDescentStackComparison | reject | The correct stack category and QCoh descent comparison are unresolved, and the WCart/motivic equivalences are conjectural in this source. No unconditional design theorem can be claimed. |
| 14 | KTheoryFiniteLocalFieldsPartIIDescentSpectralSequences | reject | The local-only scope and imports are repaired, but the corrected sign chain, finite-page conventions, convergence and two-primary suppliers remain unresolved. Do not certify the main calculation from inconsistent intermediate formulas. |

## Remaining proof obligations

- **OPEN-SIGN**: Reconcile the cobar orientation, corrected δ/Frobenius coefficients, tame-base-change transport and γ normalization through §§6–8. Items050/053/059 are explicitly proposed corrected targets. The local counterexamples do not prove that all final additive groups are wrong.
- **OPEN-HOPF**: Supply exactness/flatness hypotheses and the derived Ext comparison for distinct-unit Hopf algebroids and complete filtered comodules. Ordinary TauCeti coalgebra cofree adjunction is insufficient.
- **OPEN-DESCENT**: Read and decompose the complete Mathew–Naumann–Noel Proposition2.14 proof; verify partial-totalization indexing, connectivity, orbit/finite-limit interchange and every algebraic/refined convergence assertion. Split remaining composite results into declaration-sized obligations.
- **OPEN-STACK**: Construct the completed/derived quotient stack and QCoh Ext comparison with PR.5 and SF.1/SF.2. Check later primary sources for the conjectures; this review does not promote them to theorems.
- **OPEN-TRACE**: Provide the exact connective henselian trace comparison proving the λ cokernel and the Bott-localization passage in Remark1.7, with low-degree fibre bounds.
- **OPEN-TWO**: Decompose the Moore-spectrum η/Bockstein identity and v1^4 self-map used in Theorem8.21. Keep all module structures, 2-extensions and K(1)-localization hypotheses explicit.
- **OPEN-FOUNDATIONS**: Finish transitive primary proof contracts for spherical Witt vectors, regular-quotient HP/Koszul comparison, complete filtered lifting, and the BMS Breuil–Kisin comparison. Existing owner routes assign this work; they do not certify implementation.

The JSON includes all 90 statements and locators, a per-item search ledger, pinned signatures, eight API contracts with boundary examples, and a supplier graph with explicit open leaves. It is not a declaration-complete blueprint. See [the independent review](../reviews/REV-PAPER-LIU-WANG-22.md) for the 36 confirmed source findings and their scope.
