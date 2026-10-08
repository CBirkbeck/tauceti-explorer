# Independent review: AG2.6–AG2.7, revision 2

**Verdict: accepted after in-place corrections.** Reviewer: Codex, session codex-fWpvr3. Job: REV-AutomorphicGaloisRepresentationsPartII--AG2.6~2, issue #6990. Date: 8 October 2026.

This is an acceptance of a finished target-level planning pass under PROTOCOL §0, not a claim that the mathematics is closed or formalized. Every target of AG2.6 and AG2.7 has a node; prerequisite chains terminate in read supplier statements, precise owner requests or explicit gaps. Both stages remain **planned**, with no closed stage and every implementation status **unchecked**. The defects in the previous review’s proposed signatures and reader have been repaired by revision 2. I independently checked the resulting declarations, rather than treating its handoff or successful elaboration as evidence of source fidelity.

## Counts and changes

| Item | Result |
| --- | --- |
| Nodes | 43, unchanged: 7 definitions, 7 constructions, 22 theorems, 6 comparisons, 1 lemma |
| Node verdicts | 38 verified, 5 corrected, 0 added, 0 unverifiable |
| Baseline citations | All 11 confirmed; none removed or replaced |
| API and tests | 58 API names and 49 packet tests, all present as actual declarations or labelled examples |
| Suggested file | 94 named declarations and 53 examples, including supporting declarations and four extra acceptance examples |
| Planets | 11 retained: 5 in AG2.6, 6 in AG2.7 |
| Requests and gaps | 20 requests to 18 distinct stages; 6 explicit gaps |
| Sources | Ten original public PDFs independently read at their relevant locators and hash-checked; an eleventh, published Caraiani PDF read locally at pp.1609–1611 |
| Source findings | E3–E5 confirmed again; E6–E9 added and confirmed; 7 total |

The five corrected node IDs are listed in the every-node table below. Changes are confined to the reviewed packet, reader, suggested file, this report and the worker handoff.

1. **Compatibility quantifiers and actual supplier imports.** ACC+ §7.1, pp.1084–1085 requires determinant Hodge sums for all λ, even for very weak systems. Its density-one clause applies to rational ℓ, every λ above ℓ, every coefficient-prime place and every extending coefficient embedding; it includes crystallinity and the full labelled Hodge multisets. The weak predicate additionally retains de Rhamness for every member. I made these quantifiers explicit. Three nodes still cited named R24 objects whose carrier contradicts the weakening statement. Their direct inputs now point to the precise requested **R24.5:operations** interface, as PROTOCOL §3 requires when no existing finer node supplies the need. The supplier contradiction remains a clearly described owner gap, rather than an unresolved assertion inside this packet.
2. **Log comparison domain.** The purity node already separates the CR.6 two-boundary sequence from the AG2.1a tensor-square/closed-stratum concentration request. I added properness, fine/saturated log smoothness, verticality and Cartier type from Caraiani’s published p.1609. The two boundary families and their independent r/s indices must remain distinct. Smooth Z-coordinates contribute m to the local stratum dimension. The corrected dimensions and coefficient/Tate shifts are now explicit input conventions, supported by published pp.1609–1611 and findings E6–E8.
3. **Residual polarization ownership.** BLGGT §2.1, p.34 states the residual CM extension to 𝒢_n. The cited GlobalGaloisDeformations:G7/polarized-deformation-problem assumes a given extension, p odd and Schur-type data; it cannot prove the needed construction. I replaced that direct input with **ArithmeticGaloisRepresentations:G7**, read its generic pairing/conjugation scope, and added an exact reduction/semisimplification extension request and gap. The request retains the source’s coefficient-characteristic boundary without silently adding Schur or absolute-irreducibility hypotheses. The residual coefficient-descent proof now explicitly uses finite-image Frobenius density and characteristic polynomials, rather than a trace-only argument in small characteristic. The suggested file’s existing pairing-equation fragment now names its true supplier; no Lean signature was changed.
4. **Source records and reader.** All baseline verification receipts and the independent review object now name this job. Each source has an independent scoped-reading receipt. The reader matches every corrected statement, hypothesis, proof step, prerequisite, API statement, test, request and gap, and records the fresh acceptance instead of saying that the old needs_changes review remains current. Findings E3–E9 have this reviewer’s verdict. Source descriptions remain in our own words; no excerpts or source artifacts are included.

## Previous review’s correction requests

The prior report is REV-AutomorphicGaloisRepresentationsPartII--AG2.6. Its 43 node receipts and revision instructions were read in full. The following checks resolve its substantive revision requests.

| Requested correction | Independent result |
| --- | --- |
| Actual Lean signatures, APIs and examples | All 38 unique main names and 58 API names are real declarations after stripping comments; every one of the 49 test labels directly precedes exactly one example. Definitions have concrete bodies and use Mathlib semisimplicity/absolute irreducibility. The former prose register is gone. |
| One compatible-system owner | System is an external parameter with supplied assembly/projection laws. No AG2 carrier replaces R24. The named contradictory imports have now been replaced by the precise requested stage. |
| Raw geometric input | The AG2.1a attached-representation conclusion is not reused as a raw geometric realization. Two separate stage requests supply smooth proper projectors/multiplicity/Tate data and Caraiani’s tensor-square/closed-stratum concentration. |
| BLGGT locator | Theorem 2.1.1(3)–(4), pp.33–34; no nonexistent (4)(b). |
| Monodromy order | AHTW Definition 6.0.2/Corollary 6.0.6, pp.111–112: dominance within Weil-isotypic blocks modulo unramified twists, separate from equality of Weil semisimplifications. |
| Strong coefficient fields | CH Proposition 3.2.5, p.12 supports an enlarged field for general conjugate-self-dual cohomological forms. Liu Definition 3.2.5/Remark 3.2.6, pp.145–146 retains its relevant specialization; Hypothesis 3.2.10 remains necessary for the minimal-field geometric assertion. |
| GSp4 and finite local fields | CG Proposition 6.8, author pp.38–39 retains regular weights, good level, the extra p-Hecke eigenform polynomial condition and both ordinary unit conditions. Its Baire argument supplies finite p-adic realization before a lattice. Pilloni’s exact Theorem/Remark 5.1.7.1, pp.22–23 and reciprocal polynomial dictionary are retained. |
| Genericity | ACC+ Definition 4.3.1(3), p.972 is the existential condition. Liu D.1.2 and footnote 37, p.365 admit arbitrary local fields; D.1.4, p.368 supplies a split local place, rather than an ACC+ completely split all-place rational witness. |
| Unitary transfer | ET.7a is the pure global transfer supplier. CS §5.1, pp.730–731 and Corollary 5.5.5/Remark 5.5.6, pp.745–746 retain literal Igusa occurrence, field/level hypotheses, rank n_i, explicit parity/norm twists and full comparison away from ℓ. Known imaginary-quadratic-field and rank corrections are preserved. |
| Recognition and pseudodeformations | R01.5 already supplies arbitrary-rank recognition; only the exact regular-Frobenius descent criterion is additionally requested. AHTW Theorems 3.2.4/3.3.6, pp.30/34 use bounded stable-condition comparison, not an assumed general formal GAGA theorem. |
| Reader lag | Corrected packet statements and precise prototype boundaries are mirrored in the reader. No previous correction was lost. |

The target-level granularity is appropriate: the source-level proof routes name their substantial supplier inputs and gaps, without pretending that a long theorem has become a routine matrix calculation. No additional node or new roadmap was required by this review.

## Pinned baseline

I read every cited declaration and its surrounding hypotheses at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, including its actual use in the suggested file. The Tau Ceti pin remains **f790474821cf4256814db967cb154e7af3d0c369**; no Tau Ceti declaration is cited or imported by this file. The checks establish the matrix/representation components below, not the missing arithmetic or period theory.

| Declaration | Module under Mathlib | Supplies |
| --- | --- | --- |
| AlgebraicClosure | FieldTheory/IsAlgClosed/AlgebraicClosure.lean | Algebraic closure of a field, field/algebra and algebraic-closedness instances |
| Matrix.GeneralLinearGroup | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean | Units of finite square matrices |
| Matrix.charpoly | LinearAlgebra/Matrix/Charpoly/Basic.lean | det(XI−A), with the required sign |
| Matrix.charpoly_map | Same | Characteristic polynomial transported by a commutative-ring homomorphism |
| Matrix.charpoly_diagonal | Same | Product of X minus the diagonal entries |
| Matrix.charpoly_units_conj | Same | Invariance under conjugation by a matrix unit |
| Matrix.GeneralLinearGroup.map | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean | Group homomorphism for coefficient change, with identity/composition laws |
| Representation.IsSemisimpleRepresentation | RepresentationTheory/Semisimple.lean | Complemented subrepresentation lattice over a field |
| Representation.IsIrreducible | RepresentationTheory/Irreducible.lean | Simple subrepresentation order; apply over AlgebraicClosure for absolute irreducibility |
| Matrix.GeneralLinearGroup.toLin | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean | Multiplicative equivalence to invertible linear endomorphisms over a commutative ring |
| Matrix.rank | LinearAlgebra/Matrix/Rank.lean | Finite rank of the matrix linear-map range |

No citation needed removal or replacement. The reviewed **AUDIT-31** records for AG2.6/AG2.7 and relevant overlaps were read. Existing linear algebra is reused, while period comparison, raw geometric realization, compatible-system data, lattice constructions and arithmetic Hecke interfaces are not declared already formalized. The accepted **RS-12** ownership result was checked: early R24 operations, R19 classical/Hilbert families and rank-two geometry, AG2 higher-rank applications, R01 lattices and AG2.7 arithmetic exports retain their owners. The HodgeStructures and GlobalNumberFields upstream documents were read for density and conventions.

## Source findings and versions

All source findings have confirmed receipts by this review. The packet’s URLs, hashes, dates, version distinctions and searched lists allow the checks to be repeated. The original ten PDF hashes match exactly. Public-version readings focused on cited theorems and necessary proof passages; no private book was needed.

| Finding | Check |
| --- | --- |
| E3 | ACC+ (2.2.6), p.922 omits the odd-rank final sign. The image and the correctly signed polynomial in Theorem 2.3.5’s proof, p.938, confirm it. |
| E4 | ACC+ (2.2.7), p.922 loses the general monomial; the degree-2n sums on pp.922/927 use n−i in place of 2n−i. Both page images confirm the resulting negative-exponent problem. |
| E5 | ACC+ p.972’s local projective reading requires unramifiedness: a ramified quadratic scalar twist of 1⊕1 over F₃ at Q₂ keeps the ratios and projectivization but loses trivial inertia. Lemma 4.3.2, p.973 preserves the global existential statement after avoiding finite ramification. |
| E6 | Published Caraiani §3A, p.1611 repeats first-boundary indices in the second boundary’s log structure. Its combined structure on the same page uses both families. The second family must use j_{2,j}, U_{2,j}. |
| E7 | Published Caraiani pp.1609/1611 substitutes r for s in the second-boundary membership endpoint/chart product. Lemma 3.2’s monoid and proof require s factors; r=1,s=2 detects the slip. |
| E8 | Published Caraiani p.1610 drops m from a nonempty stratum’s dimension. The local model gives 2n+m−i−j; n=r=s=i=j=m=1 leaves the Z-line, of dimension 1. |
| E9 | CH author-copy p.4 calls both dominant weight tuples nonnegative, although they are reverse negatives. Dominant integral weights can have negative entries; (1,0) and its dual (0,−1) detect the wording slip. This finding is limited to that identified copy. |

Caraiani E6–E8 also occur in arXiv:1202.4683v1, pp.8–9. I independently viewed the published pp.1610–1611 images and CH author-copy p.4 image. The three geometric slips have clear intended corrections and do not undermine the purity theorem; the consumer now uses the corrected indices/dimension explicitly.

The bounded public erratum search on 8 October 2026 included the ACC+ publisher/author pages and arXiv history; Caraiani’s [author publication page](https://www.ma.imperial.ac.uk/~acaraian/papers.php), [arXiv history](https://arxiv.org/abs/1202.4683) and MSP article/PDF; and Harris’s [annotated errata list](https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf). No relevant correcting notice was located. The CH publisher DOI did not serve text through the browser and Chenevier’s publication-page fetch timed out; E9 consequently makes no assertion about the version of record. Known CS E10/E11/E83 and CG/Pilloni corrections remain inherited, rather than being reported anew.

## Handed red-team findings

| Finding | Resolution in packet and reader |
| --- | --- |
| RT-AREA-langlands-1/16 | AHTW v1 is explicitly an unrefereed July 2026 input. All-CM full Hodge/de Rham, Weil semisimplification and N dominance, with spherical/Iwahori consequences and a separate nonselfdual export, are planned. Quantitative local-Shimura annihilators and arbitrary-multiplicity bounded pseudodeformations are explicit owner-design gaps. Generic-only IG.5 concentration is not substituted, and no IG consumer cycle is introduced. |
| RT-AREA-langlands-1/20 | A single external R24.5:operations interface is requested. The corrected prerequisites and reader do not pretend its contradictory named carrier/weakening nodes already supply that interface. No second carrier or late rank-two potential-modularity existence theorem is constructed. |
| RT-AREA-padic-2/22 | Generic geometric comparison belongs to R06 and its CP suppliers, full rank-two applications belong to R19.5, and higher-rank projected applications belong to AG2.6. Actual raw geometry is requested before comparison; the two-boundary extension and tensor-square concentration remain separate inputs. |

## API, tests and prototype boundaries

Every definition and construction has at least three meaningful tests and an API derived from its listed consumer uses. The examples distinguish determinant Hodge sums from full multisets, weak polynomials from N, absolute from relative irreducibility, ratio genericity from distinct roots, a single local place from an all-place split-prime witness, and raw lattice reduction from semisimplification. Wrapper tests inhabit actual good/nonselfdual/polarized/unitary/residual algebraic packages; the two-character unitary sum has a proper invariant line. The strong-field example uses quaternionic matrices with rational traces and no Q model.

PROTOCOL §13 permits leaving unavailable conditions out of suggested signatures. The packet and reader identify each algebraic component and omitted condition; output signatures with essential geometric/automorphic hypotheses omitted are **not universal matrix theorems**. The Chebotarev example transports a supplied infinite witness set; the lattice example compares reductions at t=1; full number-field and p-adic provenance is declared absent. No arbitrary Prop field, empty predicate, invented automorphic representation or substitute compatible-system carrier hides those limitations. Elaborating the file verifies types and naming agreement, not these unfinished mathematical proofs.

All eleven planets are central source-based definitions, constructions or named theorems, within six per stage. None needed renaming.

## Every-node verdict

The following receipts are the complete independent record; the packet’s review.checked carries the same notes.

| Node suffix | Verdict | Check |
| --- | --- | --- |
| `extremely-weakly-compatible-system` | corrected | Corrected the predicate quantifiers from ACC+ §7.1 pp.1084–1085: retain determinant Hodge sums for all λ and full crystallinity/Hodge data for every member over density-one rational ℓ. Replace contradictory named imports by the exact requested R24.5:operations stage. |
| `geometric-coefficient-prime-comparison` | verified | CH Theorem 1.4/formula (1.6), pp.5–7 and the R06 statements justify projector-compatible comparison only after the raw geometric realization. The revision separates that request from the attached-representation conclusion and explicitly negates the supplier Hodge sign. |
| `coefficient-hodge-comparison-through-families-and-descent` | verified | CH Theorem 2.3 p.8 and §3.1–3.2 pp.9–12 retain the one varying place, bounded constant other Hodge types, S-general patching and controlled descent; generic Fredholm theory is only a supplied ingredient. |
| `polarized-branch-de-rham-and-crystalline` | verified | BLGGT Theorem 2.1.1(3)–(4), pp.33–34 has the required full Hodge, spherical crystalline and Iwahori semistable conclusions. The nonexistent (4)(b) reference is gone. |
| `log-crystalline-purity-on-the-automorphic-summand` | corrected | Caraiani Proposition 4.4/Theorem 4.6/Proposition 5.1, pp.29–32 require the tensor-square realization and diagonal concentration. Added the exact log comparison domain and corrected second-boundary/dimension conventions from published pp.1609–1611; no purity is inferred from semistability alone. |
| `full-polarized-comparison-at-the-coefficient-prime` | verified | Caraiani Theorem 1.1 pp.1–2 and the stated pure-WD uniqueness input justify retaining N in the polarized branch. Twisting, solvable descent and full pure-parameter uniqueness remain explicit supplier requests. |
| `all-cm-de-rham-and-semisimplified-coefficient-comparison` | verified | AHTW Theorem 1.2.1 pp.5–6 and Theorem 5.2.9 pp.76–77 apply in arbitrary rank to regular cuspidal forms over CM fields. Quantitative torsion cohomology and arbitrary-multiplicity bounded pseudodeformations are honestly recorded gaps, without non-Eisenstein/image assumptions or an IG.5 cycle. |
| `nonselfdual-coefficient-prime-monodromy-bound` | verified | AHTW Corollary 1.2.2 and §6 pp.111–112 separate semisimplified Weil equality from ordered monodromy dominance within Weil-isotypic classes modulo unramified twists; no unordered block comparison or automatic equality is used. |
| `all-cm-crystalline-and-iwahori-corollary` | verified | Spherical and Iwahori parameters have the needed inertia properties; AHTW’s semisimplified comparison plus the R06 crystalline/semistable criteria gives this corollary. The Iwahori conclusion does not strengthen N to equality. |
| `totally-real-polarized-coefficient-prime-descent` | verified | BLGGT’s totally real polarized scope is preserved. ET.7a’s controlled cuspidality-preserving CM base change must split the selected local place, so the local completion and its comparison are unchanged. |
| `coefficient-embedding-independence-and-semisimple-uniqueness` | verified | Good-place characteristic polynomials and the arbitrary-rank R01.5 characteristic-zero recognition statement identify semisimple members after a common coefficient embedding; no choice-independent based matrices are claimed. |
| `compatible-system-of-pi` | corrected | The all-CM and totally real polarized local conclusions provide the full weak predicates on common data. Replaced the intrinsically weak named carrier import by the requested external R24.5:operations data/assembly interface. |
| `complex-and-local-coefficient-conjugation` | verified | NT Theorem 5.1/Lemma 5.2 and footnote 4, p.38 preserve the σ⁻¹ coefficient convention and compare embeddings explicitly. AF.4’s automorphic conjugation extension is precisely requested. |
| `strong-coefficient-field` | verified | Liu Definition 3.2.5/Remark 3.2.6 pp.145–146 define the relevant specialization, while CH supplies enlarged fields more generally. The API asks for models and scalar-extension identifications, not just rational traces; the quaternionic non-example detects the descent obstruction. |
| `uniform-strong-realization-for-polarized-systems` | verified | CH Proposition 3.2.5 p.12 uses split regular Frobenius at two good places of different residue characteristics. The exact obstruction-splitting criterion is requested from R01.5; the minimal rationality field is not asserted to suffice. |
| `polarized-compatible-system-strictly-pure` | verified | BLGGT §5.1 pp.62–65 gives pure good Frobenius of weight w+n−1 and full polarized strict purity. The multiplier’s cyclotomic and algebraic-character factors are retained; weak nonselfdual systems are not promoted to this output. |
| `very-weak-compatibility-under-dgi` | corrected | ACC+ Lemmas 7.1.9–7.1.10 pp.1093–1094 retain their original density-one DGI and rank-two routes as comparisons. Replaced the contradictory weakened-object prerequisite by the requested R24.5:operations weakening map; the all-CM proof does not use downstream lifting. |
| `coefficient-prime-branch-and-what-it-does-not-give` | verified | The source strengths are separated correctly: general CM de Rham/full Hodge and Weil semisimplification with N bound, polarized full WD equality, totally real polarized scope, and regular good-level GSp4. No residual-image consequence follows merely from these local comparisons. |
| `rank-two-comparison-with-r19` | verified | Read the R19.3 fixed classical/Hilbert and R19.5 full local statements. This node compares only their exact regular-weight overlap using the AG2 dual/Frobenius conversion, without rebuilding the rank-two family or imposing an unneeded residual-irreducibility hypothesis. |
| `tensor-automorphy-independent-of-coefficient-embedding` | verified | NT proof of Lemma 5.8 pp.42–44 uses automorphic conjugation and tensor coefficient change for an already automorphic tensor. It does not infer tensor automorphy from compatibility alone. |
| `gsp4-crystalline-hodge-comparison` | verified | CG Proposition 6.8(3), author pp.38–39 retains a≥b≥3, good level at p and the p-Hecke eigenform hypothesis, with weights 0,b−2,a−1,a+b−3. Singular weight is explicitly excluded. |
| `ordinary-gsp4-coefficient-prime-shape` | verified | CG Proposition 6.8(4) and its proof p.39 need both normalized operator eigenvalues to be units. The increasing Hodge/slopes and cyclotomic sign are consistent; the ordinary filtration theorem is an R06.4 request. |
| `pilloni-gsp4-normalization-comparison` | verified | Pilloni Theorem/Remark 5.1.7.1 pp.22–23 gives geometric Frobenius, corrected similitude and the det(1−Xφ) convention. The CG/Pilloni weight and reciprocal-polynomial dictionary is requested from ML.4, not silently identified. |
| `finite-p-adic-field-of-realization` | verified | CG’s p.39 Baire proof uses countably many finite local fields, closed subgroup intersections, an open intersection and finitely many coset entries. Compactness over Q̄_ℓ is not used as a one-step finite-field argument; the R01.1 extension is explicit. |
| `residual-representation-of-pi` | corrected | BLGGT §2.1 p.34 supports residual semisimplification and its CM extension. Corrected the supplier: the deformation-problem node takes that extension as input. Added a precise ArithmeticGaloisRepresentations:G7 request/gap, retaining the characteristic boundary and avoiding Schur or self-dual-lattice assumptions; made finite-image Frobenius density explicit in coefficient descent. |
| `good-polynomial-reduction` | verified | The full statements of Matrix.charpoly_map and GeneralLinearGroup.map at the pin give integral matrix reduction. Semisimplification preserves characteristic polynomials; small characteristic uses polynomials rather than trace-only recognition. |
| `hecke-maximal-ideal-of-galois-type` | verified | ACC+ Definition 2.3.6 p.938 requires a continuous semisimple finite-residue-field realization of every good Hecke polynomial. Uniqueness is an R01.5 consequence. The prototype uses Mathlib semisimplicity and polynomial matching, without defining a fake Hecke algebra. |
| `non-eisenstein-maximal-ideal` | verified | ACC+ Definition 2.3.6 p.938 requires absolute irreducibility. The Lean predicate tests Mathlib irreducibility after algebraic-closure coefficient extension; the real rotation example distinguishes relative irreducibility. |
| `residual-hecke-ideal-independence` | verified | At fixed λ, the reduced integral eigencharacter and its kernel are independent of lattice, basis and enlargement. A different λ need not give the same ideal; the typed signature covers coefficient-map kernel behavior and declares missing Hecke maximality. |
| `dual-and-character-twist-hecke-comparison` | verified | ACC+ §2.3.6 p.938 gives r∨ε̄^(1−n). Geometric Frobenius eigenvalues become q^(n−1)/α_i, with rank 2n replacing n in the unitary case; integrality and character twists are requested from IHG. |
| `the-residual-ratio-condition-for-taylor-wiles-primes` | verified | ACC+ Definition 4.3.1(1) p.972 requires trivial inertia and ordered ratios excluding q, with multiplicity. Repeated roots may pass, and unequal roots may fail. Algebraic-closure factorization, coefficient transport and concrete tests are present. |
| `completely-split-generic-prime` | verified | ACC+ Definition 4.3.1(2) p.972 uses a rational prime completely split in F and genericity at every place above it, with p≠ℓ. The prototype uses the supplied entire nonempty place fiber, e=f=1, explicit coefficient characteristic and all-place quantification. |
| `existential-decomposed-genericity` | verified | ACC+ Definition 4.3.1(3) p.972 is existence of one completely split all-place witness. The trivial reducible rank-two F₃ example separates it from irreducibility and checks p=2 versus p=7. |
| `strong-local-decomposed-genericity` | verified | CS Definition 1.9 p.652 and Liu D.1.2/footnote 37 p.365 use the stronger local exclusion of 1 and q. The arbitrary local residue cardinality is retained, including the unramified quadratic Q₂ example. |
| `infinitely-many-decomposed-generic-primes` | verified | ACC+ Lemma 4.3.2 p.973 enlarges the finite normal extension by the normal closure and cyclotomic field, preserving all-place splitting and p mod ℓ. R01.5 owns Chebotarev; the Lean fragment transports an assumed infinite witness set rather than claiming to prove number-field Chebotarev. |
| `genericity-transfer-and-projective-qualification` | verified | Conjugacy, coefficient change and unramified scalar twists preserve local genericity. E5’s ramified scalar-twist counterexample prevents unqualified local projective invariance; the global finite-character-twist claim follows by avoiding finite ramification. |
| `finite-exceptional-residual-genericity-for-relevant-pi` | verified | Liu D.1.4 p.368 controls a finite coefficient-exception set using root and nonratio differences, then supplies a generic split local place. It is not substituted for ACC+’s all-place completely split rational witness or for concentration. |
| `good-prime-characteristic-zero-export` | verified | The good-prime wrapper consumes external common data and exact AG2.0 polynomials, without claiming bad-place N. Its rank-one, classical weight and distinct-monodromy tests use the stated algebraic components. |
| `nonselfdual-hodge-and-monodromy-bound-export` | verified | The nonselfdual wrapper exposes full labelled Hodge data, semisimplified Weil parameters and N dominance independently. Its non-example and wrapper tests detect strengthening the bound to equality; the AHTW source/gaps stay visible. |
| `polarized-hodge-and-wd-export` | verified | The polarized wrapper retains an actual pairing, good-prime purity and one map intertwining both Weil and N. Full weight-k Hodge extraction and the Weil-only monodromy counterexample distinguish it from the weaker wrapper. |
| `unitary-discrete-parameter-export` | verified | CS §5.1 pp.730–731 and Corollary 5.5.5/Remark 5.5.6 pp.745–746 retain literal Igusa occurrence, field/level hypotheses, constituent ranks n_i, explicit parity/norm twists and full local comparison only away from ℓ. Corrected splitting field K is retained; the two-character sum is explicitly reducible. |
| `lattice-residual-polynomial-export` | verified | The residual export retains an integral model, residue map, semisimple member and good polynomial reduction; it never asserts raw lattice reduction is canonical. The diagonal mod-3 computation and unequal unipotent mod-5 reductions test that boundary. |
| `rank-two-residual-comparison-with-r19` | verified | The R19 classical/Hilbert comparison is restricted to fixed λ and the same residue embedding after the dual/twist normalization. Residual characteristic-polynomial recognition supplies the isomorphism, while residual-image/lifting hypotheses remain separate. |

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.6.lean`: **exit 0; 95 warnings, all declaration uses sorry**. Memory was checked before compilation, and the existing shared build’s Mathlib HEAD equals the exact pin. The file imports only Mathlib modules, so no unverified Tau Ceti module participates. One compile was run, with no language server or Lake build/update/cache command.
- A comment-masking check confirmed all 38 main names and 58 API names against actual Lean declarations, all 49 labels directly against following examples, and the 94-declaration/53-example totals.
- Exact reader agreement checks passed for all node statements, hypotheses, proof steps, prerequisites, API/test statements, requests and gaps. All eleven public PDF hashes matched the source records; every source finding names this review and every node has exactly one verdict.
- JSON parsing, implementation-status/planet counts, changed-path inspection, forbidden local-path/source-artifact inspection and `git diff --check` passed.

No maintainer question is needed to finish this review. Full closure still needs the six recorded supplier gaps and their 20 precise requests. Route those through their owners: start with R24 data/predicate separation, AG2.1a raw/tensor-square geometry and G7 residual polarization, then close CR.6/R34.6 and the AHTW quantitative/pseudodeformation extensions. Complete the remaining family/descent, Hecke, coefficient-field and GSp4 requests before replacing the documented Lean fragments with full supplier-typed statements. This completed independent review requires no checkpoint or second job claim.
