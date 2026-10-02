# Algebraic K-theory area fix, round 2

Job `FIX-RT-AREA-ktheory-1~2`, [issue #5541](https://github.com/CBirkbeck/tauceti-explorer/issues/5541). Agent: Codex, session `codex-5ebb6f`. Date: 2026-10-02.

Status: **complete disposition of the 38 assigned confirmed high/medium findings; independent review pending**. The five revised packet/reader/suggested-file triples contain the plan repairs. This does not assert that their entire roadmaps, future suppliers or Lean implementations are finished. Unrelated remaining gaps are explicit. The N.1 and K3BlochGroups triples retain their accepted repairs and subsequent review history unchanged. Finding /38 was rejected by the verifier; /40–49 are outside this fix's assigned scope.

This round addresses the remaining objections in [REV-FIX-RT-AREA-ktheory-1](../reviews/REV-FIX-RT-AREA-ktheory-1.md), including its corrections C1–C12. Earlier decisions are preserved in `reviewHistory`; the five revised packets request a new independent review rather than declaring themselves accepted. Proposed stage changes remain proposals. No campaign document, reviewed atlas data, other worker's packet, issue label or upstream Tau Ceti roadmap was edited.

## Deliverables and validation

| Packet | Nodes | API items | Unit-test obligations | Remaining roadmap gaps |
| --- | ---: | ---: | ---: | ---: |
| [ArithmeticKTheory N.1](../packets/ArithmeticKTheory--N.1.json), unchanged | 56 | 75 | 53 | 7 |
| [GeneralAlgebraicKTheory K.1](../packets/GeneralAlgebraicKTheory--K.1.json) | 83 | 117 | 80 | 1 |
| [K2SymbolsBrauer T.3](../packets/K2SymbolsBrauer--T.3.json) | 77 | 123 | 73 | 4 |
| [ArithmeticKTheory N.7](../packets/ArithmeticKTheory--N.7.json) | 26 | 39 | 30 | 2 |
| [GeneralAlgebraicKTheory K.6](../packets/GeneralAlgebraicKTheory--K.6.json) | 73 | 119 | 79 | 2 |
| [K2SymbolsBrauer T.1](../packets/K2SymbolsBrauer--T.1.json) | 66 | 107 | 73 | 18 |
| [K3BlochGroups](../packets/K3BlochGroups.json), unchanged | 101 | 212 | 128 | 24 |

The five revised packets add 116 nodes, for 325 nodes in those packets and 482 across all seven. Their reader documents are synchronized with the statements, proof steps, API, tests, source-reading boundaries, requests, source discrepancies and proposed parents. The suggested K.6 file replaces the old `True` and dummy-carrier placeholders with typed future interfaces, including the controlled cone matrices and finite-domination model. The other suggested files retain their useful pinned prototypes and add the new interfaces. A commented future interface is a plan, not an elaborated declaration.

Validation on 2026-10-02:

- All seven packets pass `scripts/check_blueprint.py` against the pinned declaration index with **zero errors and zero warnings**.
- The independent standard-library checker printed in the [N.7 reader](../readmes/ArithmeticKTheory--N.7.md) verifies all eleven finite residue-step certificates directly from the packet: exact factorizations, reduction maps and generation, congruent-unit witnesses, selected determinants and gcds.
- The standard-library checker printed in the [T.1 reader](../readmes/K2SymbolsBrauer--T.1.md) passes all five relative-bar cases over coefficients modulo 2, 3 and 5, including the noncentral `S₃ → C₂` example. These computations are regressions, not substitutes for the integral proofs.
- The 482-node regional prerequisite graph has no directed cycle. Its stage projection is acyclic after the explicit parent proposals and the two V.5 consumer-import corrections below. This is a projection of the affected packet family, not a claim that all unrelated atlas stages were audited or that the maintainer applied the proposals.
- The atlas was assembled read-only to inspect existing suppliers and ancestry. The existing /38 ancestry is retained. The proposed early generic H.5 spectrum interface and M.3 symbol interface were checked against their existing supplier directions; late M.8 is not a prerequisite of the new Chern-sign adapter.
- Deliverable-path intake and whitespace checks pass. **No Lean compilation was run**: an existing usable build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was not available. No Lake project, cache download, library build or language server was started.

## Finding-by-finding dispositions

Every number denotes `RT-AREA-ktheory-1/<number>`. Handoffs follow PROTOCOL §17: the named unfinished blueprint job owns the missing plan. Those nine destination issues were rechecked on 2026-10-02 and remain open, available blueprint jobs. A handoff does not certify their future proofs.

| Finding | Applied repair or concrete supplier handoff |
| --- | --- |
| 1 | Preserve N.3's decomposed rank filtration, comma categories, suspended buildings and finite-generation spectral sequence, including the reviewed rank-zero correction. [Borel #74](https://github.com/CBirkbeck/tauceti-explorer/issues/74), R.1, supplies integral arithmetic-group finiteness with `Steinberg ⊗ ℤχ^(n−1)` and `χ = Norm(det)`, for all finite-index arithmetic groups of the relevant projective modules, not only the free case. |
| 2 | [M.1 #957](https://github.com/CBirkbeck/tauceti-explorer/issues/957) and [M.5d #959](https://github.com/CBirkbeck/tauceti-explorer/issues/959) own Beilinson–Lichtenbaum: derived truncation over fields, naturality and coefficients, then smooth-scheme and Dedekind variants with their actual topology hypotheses. A Dedekind base is not silently reduced to the smooth-over-a-field theorem. |
| 3 | Preserve N.5's imported real/complex comparison. #959 supplies real Suslin comparison in positive degrees using KO, and complex comparison using KU; topological real K-theory is RT.4's supplier. The dyadic degree-zero exception is not included in the positive-degree theorem. |
| 4 | K.1 now decomposes objectwise S-additivity, pushout comparison, relative-S paths and the zero augmentation, iteration, double-swallow and S/Q comparison. K.6 supplies the biexact S-grid, latching-cofibration proof, stabilization and coherence. K.4:construction and proposed K.7:products precede their consumers; [H #999](https://github.com/CBirkbeck/tauceti-explorer/issues/999) assembles the spectrum and supplies generic smash/realization facts. |
| 5 | Correct the handoff to #999: H.3 owns plus/simple-CW and local-coefficient Whitehead inputs; **H.6**, not H.3, owns rational Hurewicz. #74 imports that H.6 theorem. Connectedness, simple action and finite-type conditions are part of the contracts. |
| 6 | #74 R.5 supplies the arithmetic quotient input for the specified inner forms split at infinity, and sufficient nonzero rational volume with the chosen measures. No general Tamagawa-number assertion replaces the narrower theorem needed by the finiteness argument. |
| 7 | Preserve N.3's S-integer higher-degree rank range `≥2`; degree one uses S-unit rank. #74 R.3 must state the same separation when exporting orders/ranks to arithmetic K-theory. |
| 8 | M.3, in #957, remains the single owner of the general-field Galois symbol, its tensor-twist formula, Steinberg relation, and separate local/global/S-integer Tate theorems. T.7 imports it and compares conventions; N.6 and downstream local-field/Birch–Tate consumers import Tate's theorem from M.3. |
| 9 | N.6 retains sole ownership of the order-certificate engine with upper generation and independent lower evidence. T.5 now proves the K₂(ℤ) upper bound by the S-unit filtration, strict residue-norm criterion and balanced representatives, then uses the independent real sign lower bound. K₂(ℚ) follows the tame sequence; elementary finite-field K₂ remains T.2's. [U.1 #764](https://github.com/CBirkbeck/tauceti-explorer/issues/764) imports these results. |
| 10 | Preserve N.4's finite twisted `w₂`, with finite K₂ supplied independently by N.3. [Birch–Tate #998](https://github.com/CBirkbeck/tauceti-explorer/issues/998) imports those inputs before its order formula; it does not prove K₂ finiteness by assuming that formula. |
| 11 | N.7 adds Gaussian cutoff/vanishing and the nine-node real-quadratic proof: Euclidean arithmetic and units, congruence lattices, small fractions, residue section, generator and multiplicativity checks, norm cutoff `q>33`, eleven finite certificates, and upper generation. The two real sign characters independently give the lower bound four. #998 B.3 may import the resulting ℚ(√5) certificate after review; neither bound comes from Birch–Tate. |
| 12 | T.4 now has finite mixed normalization via a finite normal hull and its pure-first/separable tower, complete-field norms, normalization/completion splitting and the all-degree Milnor norm–residue theorem. Inseparable residue extensions and proper **regular**, possibly nonsmooth, models remain explicit. #957 M.4 imports the all-field norms/reciprocity; AC12 supplies the point/place dictionary. |
| 13 | #959 M.5d owns Bloch–Gabber–Kato over imperfect fields, with early differential/Cartier inputs. Mod-p `1−C⁻¹` and prime-power logarithmic Witt constructions are separate obligations. No perfect-field shortcut is added here. |
| 14 | #957 M.1/M.3 supplies early Kummer theory, cup products and `μ_m ⊗ μ_m`; multiplication of roots of unity is not used as a purported bilinear tensor pairing. T.7's formulas explicitly contract the tensor twist using the chosen primitive root. |
| 15 | K.1's relative-S model now includes the canonical path for a zero source, with genuinely correct zero augmentation; the iterated argument is decomposed. #999 H.2 supplies good/proper simplicial realization, connectedness and the comparison from the specified simplicial fibres to the canonical homotopy fibre. |
| 16 | #999 H.5 owns chain-level Eilenberg–Mac Lane/HR spectra, their module comparison, grading, truncation and representability as separate statements. K.1/K.6 import those interfaces instead of declaring them supplied by the bare existence of spectra. |
| 17 | K.6 adds the noncommutative right-module projective-line proof: opposite-ring charts, finite-clearing regularity, canonical resolution, twists, quotient models, actual resolution-fibre contraction, directed lattices and Nil localization. The whole Nil functor map and the `MR` matrices are explicit. [Scheme K #987](https://github.com/CBirkbeck/tauceti-explorer/issues/987), S.2/S.5, imports this ring argument before its scheme specialization. |
| 18 | K.1 supplies the actual relative-triples/π₀ comparison, stable five-term sequence, Milnor patching and degree-zero ideal excision. K.5 retains all four interior exact positions. K.6's negative Bass statement remains separate. U.6 owns positive comparisons: henselian relative fibres are 1-connective; the generally stated birelative input is only 0-connective unless the additional π₁ surjectivity is established. |
| 19 | Preserve the early K.2 ring model and connective continuity. K.6/K.7 now give unitization fibres, the complementary-idempotent extension for nonunital maps, matrix-corner Morita naturality and filtered stable-fibre continuity. Infinite corner matrices are a **nonunital** diagram. Scalar-extension maps on right modules retain their opposite-ring convention. |
| 20 | K.2:plus uses free/projective group-completion cofinality and the new early absolute degree0/1 comparison, importing classical K₀/GL/E from U.1/U.2. The general exact-category cofinality proof is decomposed using the K₀-defined weak class and is proposed after K.4. No nonfree stably-free module is used as a degree-zero counterexample. |
| 21 | Preserve the pinned exact structure, finite-projective subcategory and ExactK0 reuse. K.1 now decomposes extension base change, its actual cartesian direction, localized fibres, one-step/bounded resolution, dévissage contractions and Serre localization. Bühler supplies the cokernel/3×3 exact-category route; no claim is made that Quillen's expressly omitted embedding details were read as a proof. |
| 22 | #999 H.1/H.2/H.3 supplies nerves, covering/local-system comparisons and homotopy realization. The comparison with the twisted Serre spectral sequence uses AT8; an AT5 constant-coefficient homology theorem alone is insufficient. |
| 23 | #999 H.6 is the single owner of general exact couples and spectral-sequence infrastructure. #987 S.4 imports it and supplies geometric filtration/convergence inputs; it does not replan a scheme-specific general spectral-sequence construction. |
| 24 | #764 U.4 owns S-unit rank, the finite-index subgroup argument and the exceptional rank-one cases in SK₁. These are not swallowed by a stable higher-rank assertion. |
| 25 | #764 U.4 retains the verifier's **number-field** Bass–Milnor–Serre scope, using CFT12, Chebotarev10 and CA1 reciprocity. A function-field theorem cannot be inferred from this argument without its own source and hypotheses. |
| 26 | T.5 distinguishes outside-S tame-kernel residues from the in-S relative sequence; surjectivity imports U.4's SK₁ theorem. K.1's early K.3 automorphism-square/index calculation gives `∂[α]=[coker α]−[ker α]` and `∂[π]=1` for a DVR, before T.3's comparison. This removes the S.3 normalization cycle. |
| 27 | T.7 now fixes `c₂,₂=−h` from Soulé's product formula, and the **inverse** local cup-invariant formula for the packet's arithmetic-Frobenius symbol convention. The odd-order ℱ₇((t)) test detects inversion, while exponent coordinates use `(ℚ/ℤ)[m] ≃ ℤ/m`, not multiplication by m in ℚ/ℤ. CFT5/6's normalized character-evaluation proof remains an explicit upstream supplier request; CFT10/14, QFI6E/7B and CA1 supply their existing reciprocity/comparison roles. |
| 28 | Elementary residues and Milnor norms precede the Quillen comparison. T.4's new proof gives every finite-extension norm–residue square, including inseparability. The early K.3 Artin-filtration transfer theorem and new Milnor base-change proof include composition-length multiplicities. The trivial-valuation constant-extension case of PR #5300 is retained; finite-extension residue scope is not confused with arbitrary constant base change. |
| 29 | Preserve the accepted K3BlochGroups repair: V.1 imports T.1's UCE/perfectness results, with no duplicate UCE construction, and keeps the plus-fibre/Hurewicz comparison. This does not certify unrelated T.1 supplier gaps or K3BlochGroups source gaps. |
| 30 | T.1 adds the kernel relative-bar complex, the chain-level `H₁ ≅ N/[E,N]` identification, the pinned ShortExact homology boundary, and naturality with the actual group-homology map. No freeness assumption on N is inserted. The Hopf formula and its natural map now use that construction, replacing both former Hopf gaps. #999 retains the distinct topological plus/Hurewicz obligation. |
| 31 | Preserve the reviewed source correction: the doubled affine **plane** gives vector-bundle K₀=ℤ and perfect K₀=G₀=ℤ²; the doubled affine line is not this example. [Z.3 #765](https://github.com/CBirkbeck/tauceti-explorer/issues/765) imports the corrected example and its source discrepancy. |
| 32 | T.4 imports AC12's regular point/place dictionary and proves the adapter for EC2's disjoint-support evaluations; it does not duplicate either upstream construction. The curve x-example retains the equal normed evaluations 81/25 and the reviewed uniformizer-last sign. |
| 33 | **Corrected handoff:** #999 H.6 alone owns rational Hurewicz/Cartan–Serre/Milnor–Moore, with connected CW, homotopy associativity and the finite-type qualifications needed for cohomological duals. #74 R.3 imports it. The older raw /5 assignment to H.3 does not override the verifier's H.6 correction. |
| 34 | #74 R.4 imports S.6 algebraic Adams operations together with RT.4's comparison to **topological** Adams operations. That comparison is required before identifying the Borel eigenspaces. |
| 35 | #74 R.2 imports the early characteristic-zero Betti/de Rham/Lie quotient comparison from ALS.5. It does not wait for a downstream AS.5 result, and no existing algebraic-groups roadmap is replanned here. |
| 36 | #74 owns the all-weight Burgos normalization `Bo=2 Be`; the determinant factor is `2^d`. A weight-two Bloch–Wigner check is a test, not a proof of the all-weight statement. |
| 37 | [Finite/local #763](https://github.com/CBirkbeck/tauceti-explorer/issues/763) retains Green's embedding/choice-of-root and induction/restriction interfaces, RT.4's Atiyah–Segal/Adams input, `K⁻¹(BG)=0` and the simple-space Whitehead hypothesis. These exact imports precede the finite-field calculation. |
| 39 | #763 L.5 imports the general log-Witt construction before the DVR specialization and TR comparison; CR4/5 precede CR6's Hyodo–Kato comparison. Preserve odd p and ℤ_(p)-algebra scope and supply actual model comparisons. |

The rejected /38 is unchanged: the existing paths `CFT5 → T.7 → L.3` and `CFT5 → D.7 → M.7 → L.6` already provide the ancestry. No new edge between Tau Ceti's own roadmaps is proposed.

## Proof repairs that go beyond a renamed gap

### Waldhausen and Quillen models

The K.1 additions specify the objectwise pushout behind S-additivity, the natural transformations through the double-swallow, the relative path model and zero augmentation, and the edgewise S/Q comparison. Approximation uses the iterated cylinder and finite-poset factorization data required by the proof, including the nonfunctorial factorization variant; it is not asserted from an arbitrary functor's equivalence on objects.

Quillen resolution is split into the one-step comma-category contractions and the bounded-resolution filtration, with kernels, pullbacks and the three resolution-dimension inequalities stated. Dévissage uses the actual intersection layers `r=(M₀∩M′, M₁∩M′)` and `s=(M₀∩M′, M₁)` and the embedding of their quotient in `(M₁/M₀)⊕(M/M′)`, without assuming extension closure of the dévissage subcategory. General cofinality uses the source's Grothendieck-class weak equivalences after Waldhausen theory; early projective cofinality uses group completion.

The classical triple construction precedes the relative homotopy comparison. Its split additive relations, stable boundary and five-term exact sequence are explicit. The π₀ comparison uses the early absolute ring K₀/K₁ adapter and the actual automorphism path; it does not assume the later relative π₁ theorem. Degree-zero excision uses the patched module and the split-augmentation Milnor square, rather than pretending that negative absolute exactness alone computes the relative π₀ fibre.

### Noncommutative projective line and negative K-theory

All charts use right modules, hence the opposite-ring scalar extension, with the variable central. Eventual regularity clears finitely many denominators; the canonical vector-bundle resolution and its twisted filtration are explicit. Resolution fibres contract through `V⊕V₀`, not through the invalid pullback used before. Directed lattices are enlarged as `V+I^(−n)K`. The whole Nil functor maps by `(t−ν,1−t⁻¹ν)`, whose finite geometric inverse gives the required comparison before additivity.

The Frobenius graph factorization has middle object **B⊕I**, not A⊕I. Dense triangulated K₀ classes, roof strictification, replacement categories, opposite approximation, nested weak-equivalence fibrations and the completion spectrum are separate nodes. This route proves the all-integer spectrum localization theorem before using it for comparisons.

The Karoubi cone uses countable sequences with finitely many object types, finitely many entry values and uniform row/column bounds. Its index is a **graded relative triple with its transition map**, not the bare ungraded difference of two projective classes. Cutoff changes are killed by the stated quasitrivial/elementary-shear relations. The four negative-ring axioms do determine the theory and its boundaries; uniqueness assumes matrix stability, while verifying that axiom by nonunital continuity is a later, separate theorem. No equality `S(R[t])=S(R)[t]` is claimed.

Finite-chain domination is distinct from a homotopy equivalence: `gf ≃ id` only makes `fg` a homotopy idempotent. Ranicki's explicit block idempotent, alternating tail and Euler obstruction supply the finite model in the idempotent completion. The restricted-completion return criterion, finite quotient lifts, complex mapping cylinder and approximation then compare the additive cone with Frobenius IK. Keller's separate exact-versus-additive criterion remains an explicitly unread auxiliary input; it is not used to conceal a gap in this localization/agreement route. The finite Artin counterexample's K₃ input remains a precise supplier request, and the older universal abelian-negative-vanishing claim is corrected using Neeman's counterexample.

### Arithmetic certificates

For ℤ, balanced residue representatives and the strict norm-difference bound strip each odd prime; the dyadic Steinberg relation removes the remaining `{−1,2}`. The real sign independently detects `{−1,−1}`. For ℤ[i], Euclidean radius `1/√2` gives the cutoff and the three small-unit relations kill the residual generators.

For ℚ(√5), write ε²=ε+1 and `N(a+bε)=a²+ab−b²`. The rounding estimate is `5/16`, the embedding covolume is `√5`, and the congruence-lattice estimates use `d=2√5/π`. The resulting norm cutoff is `q>33`. The eleven small prime ideals have norms 4, 5, 9, 11, 11, 19, 19, 29, 29, 31, 31. Their packet contains exact old-unit factorizations and congruent-unit relation vectors, with selected-minor gcds `q−1`. Do not force the torsion-column minor into the norm-4 selection: that gives gcd 6 instead of 3. A pinned lattice-index theorem proves that the subgroup index divides the selected gcd; residue surjectivity gives the converse divisibility. Two independent real sign characters then prove the order four and distinguish the two generators. Neither GRH, a numerical Birch–Tate value nor a computer-algebra package supplies the generation proof.

### Norms and sign conventions

The complete degree-one calculation gives `v(Nx)=f·w(x)` and, on units, `N̄(u)=N_residue(ū)^e`. The all-degree Milnor norm–residue square sums norms over residue fields without inserting an extra e. Finite normalization/completion and the pure-first normal-hull tower handle mixed inseparability. General base change through a nonreduced tensor product uses its Artin composition lengths.

The packet's norm-residue symbol is `Artin(a)(b^(1/m))/b^(1/m)` with arithmetic Frobenius. Milne's cup convention evaluates the reversed pair; thus the packet uses the inverse cup-invariant value. Soulé's product formula independently yields `c₂,₂=−h`. The regression over ℱ₇((t)), m=3, ζ=2 gives `NRS(t,3)=2` and `NRS(3,t)=4`, detecting a sign error invisible at m=2. The remaining CFT character-evaluation proof is named and typed, rather than labelled a solved theorem simply because Milne quotes it.

## Source reading and source discrepancies

Exact editions, URLs, hashes, read sections and proof limitations are in the packets and readers. Major newly closed source inputs include:

- [Quillen, Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf), §2–5: all page images PDF15–32 read, publication pp99–116/top typescript pp91–108. The embedding paragraph explicitly omits details; the independent exact-category input is retained.
- [Waldhausen, Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf), the additivity, approximation, double-swallow and S/Q proof passages; [Thomason–Trobaugh](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf), cofinality pp270–277. Diagrams used in the new nodes were checked against page images.
- [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf): II2.10/Ex2.17 and ideal excision/patching; IV low degrees, Ex1.15–16 and Ex7.9; V transfers, localization index/product signs, and the noncommutative projective-line proof. Read source exercises are explicitly distinguished from the worker's proof derivations.
- [Karoubi 1970](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf), §1–3, and [Karoubi 1971](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf), the K₁ Laurent proof, filtered index comparison and contraction theorem. Polynomial/suspension ring interchange is not inferred.
- [Carlsson–Pedersen](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carlped.pdf), the complex-lifting lemmas, and [Ranicki](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf), §1–3/finite-domination and relative obstruction. The subsequent topological applications are not claimed read.
- [Gille–Szamuely, first edition](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), §7.3–7.4 proofs, including inseparable norms and complete-field residue squares. Appendix A6's stated finiteness result has an omitted proof; the worker's normal-hull derivation and the pinned integral-closure results supply the mixed case instead of claiming Serre's cited proof was read.
- [Soulé's author-hosted thesis transcription](https://www.ihes.fr/~/soule/documents/These_Christophe_Soule.pdf), the Chern product formula/product proof and c₁/Kummer calculation. This recent transcription has unresolved reference markers; it is not asserted identical to the 1979 journal article. No Tate or S-integer proof was inferred from that transcription.
- [Milne, CFT 4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), III§3–4. The normalized character-cup evaluation is quoted there with proof referred to Serre; that proof remains the explicit CFT5/6 upstream obligation.
- Bass–Tate's unit criterion and the ordinary-density-one part of Groenewegen's bound supply the independently specialized ℚ(√5) cutoff. The preliminary Belabas–Gangl introduction and imaginary-quadratic algorithm are not cited as a real-quadratic generation proof.
- [Neeman, v2](https://arxiv.org/pdf/2006.16536v2), introduction pp1–2, corrects the obsolete universal negative-vanishing claim. The Artin K₃ papers and Keller criterion remain unread and named.

Four discrepancies are preserved with locators, corrected statements, counterchecks and searched errata in `sourceIssues`:

1. Extension-category cartesianness has the base-change direction reversed in the K-book passage; the packet gives the correct pullback-arrow direction.
2. K-book V7.3's projective-line localization/resolution-fibre shortcuts omit the quotient and genuine contraction data; the packet supplies them instead of using the false pullback contraction.
3. HA6.8.4's central-subgroup formulation still needs trivial action on the coefficient module for its displayed trivial-action homology term. The C₂/ℤ sign-action case detects the omission.
4. Gille–Szamuely first-edition p197 defines the Artin base-change multiplicity by nilpotence index; the norm formula needs **composition length**. For `F=ℱ_p(s,t)` and `E=F(s^(1/p),t^(1/p))`, `E⊗_F E ≅ E[X,Y]/(X^p,Y^p)` has length p² but nilpotence index 2p−1. The degree-zero norm detects the error. The author's first- and second-edition errata were both read; neither lists this entry. Only the hashed first-edition copy is implicated, and novelty is not established. The second-edition book was not read.

## Stage integration and remaining supplier work

The packet `restructure` entries and `proposedParentStageId` fields are the integration instructions. In particular:

1. Early K.4:construction includes S-additivity and relative-S delooping; H.5:S-delooping assembles its spectrum. Drop the unused E5/H.5 prerequisites of early construction and import its actual H.2 realization input.
2. Early K.7:products contains **four** product-construction nodes; generic H.5 smash/module-boundary interfaces do not depend on K.3 localization. General cofinality moves to K.3:cofinality after K.4; early ring/free-projective comparison stays in K.2:plus.
3. K.2:plus's absolute π₀/π₁ adapter precedes K.5. The later K₂/relative-comparison aggregator is not an early K.3/K.5 prerequisite. Negative-theory uniqueness assumes its four axioms; K.7 later verifies nonunital matrix continuity for the candidate.
4. T.2's transfer-torsion corollary moves to a separate `T.2:symbols:transfer-torsion` stage after early K.3 and connective continuity. The elementary Matsumoto stage stays early. T.2:graded-map imports K.7:products, not late K.7.
5. The new Milnor norm/completion nodes belong to T.4, keeping `T.3:symbols → T.4 → T.3:localization-comparison`. Their stable ids do not justify placing them in an umbrella T.3 stage depending on T.4.
6. `N.8:K2-examples` separates independent tame-kernel certificates from mixed K₃ examples. The unchanged V.5 nodes still import the whole N.8 while N.8 imports V.5. The N.7 proposal explicitly hands off removal of those two reverse imports: V.5 owns the Lee–Szczarba K₃(ℤ) source computation and derives the Gaussian K₃ result from its own number-field theorem. This proposal preserves the accepted UCE import repair; the unread Lee–Szczarba proof is not declared complete.

The CFT5/6 normalized finite-character evaluation is an `upstreamNotes` request because Tau Ceti's own roadmap is not replanned. M.3's general-field Chern product interface is an early supplier request, independent of late M.8. H.5 supplies stable filtered-colimit/fibre commutation and module boundary signs. The external blueprint handoffs above remain their named owners' responsibility. Remaining Dennis–Stein/relative-π₂, twist, Artin K₃, Keller, Kummer/Herbrand–Ribet and unrelated T.1/K3BlochGroups gaps are visible in their packets; this fix does not conceal them.

For reproducibility, save this standard-library audit outside the repository and run it from the repository root. It verifies the regional node graph and the **proposed** stage projection, including the two explicit unchanged-V.5 import corrections, rather than silently treating them as applied:

```python
import json
from pathlib import Path
names = ['ArithmeticKTheory--N.1', 'GeneralAlgebraicKTheory--K.1',
         'K2SymbolsBrauer--T.3', 'ArithmeticKTheory--N.7',
         'GeneralAlgebraicKTheory--K.6', 'K2SymbolsBrauer--T.1', 'K3BlochGroups']
nodes = {n['id']: n for name in names for n in
         json.loads(Path(f'research/blueprint/packets/{name}.json').read_text())['nodes']}
parent = {k: n.get('proposedParentStageId', n['parentStageId']) for k, n in nodes.items()}
node_graph = {k: set(n['prerequisites']) & nodes.keys() for k, n in nodes.items()}
stage_graph = {s: set() for s in parent.values()}
for key, n in nodes.items():
    for dep in n['prerequisites']:
        if key in ['K3BlochGroups:V.5/k3-Z-and-Q', 'K3BlochGroups:V.5/k3-gaussian'] \
                and dep == 'ArithmeticKTheory:N.8':
            continue  # Explicit N.7 proposal; the V.5 packet is unchanged.
        target = parent.get(dep, dep.split('/')[0])
        if target in stage_graph and target != parent[key]:
            stage_graph[parent[key]].add(target)
def check(graph):
    active, done = [], set()
    def visit(key):
        assert key not in active, active + [key]
        if key in done:
            return
        active.append(key)
        for dep in sorted(graph[key]):
            visit(dep)
        active.pop()
        done.add(key)
    for key in sorted(graph):
        visit(key)
check(node_graph)
check(stage_graph)
print(len(nodes), 'nodes; regional node graph and proposed stage projection acyclic')
```
