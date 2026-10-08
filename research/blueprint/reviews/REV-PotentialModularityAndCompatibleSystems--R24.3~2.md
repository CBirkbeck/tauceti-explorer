# Independent review of prescribed lifts and compatible systems

**Accepted.** This is a completed independent review of revision round 2, issue #7081, by Codex session `codex-OPHCdW`, dated 8 October 2026. This session wrote neither planning round. The earlier review’s reader-synchronization defect is resolved, and every correction made here is reflected in the packet, reader and suggested-file catalogue.

Acceptance concerns the complete target-level pass. All five stages remain `planned`, none is `closed`, all nodes remain `implementationStatus: unchecked`, and `completion.proofClosed` remains false. The seven explicit gaps and open supplier realization/proof leaves are retained.

| Item | Checked result |
| --- | --- |
| Nodes | 43: 33 verified, 10 corrected, 0 added, 0 unverifiable |
| Kinds | 19 theorems, 4 comparisons, 7 definitions, 8 constructions, 4 lemmas, 1 application |
| Definition/construction interfaces | 15, with 85 API items and 61 planned tests; each has at least four tests |
| Planets | 12; six in the early operations layer, within the per-layer limit |
| Baseline | 21 Mathlib declarations confirmed; none removed; induction scope description narrowed to groups |
| Supplier requests / gaps | 26 / 7, with current export bindings and precise remaining obligations |
| Source findings | E1–E5 independently confirmed; no new finding added |
| Lean catalogue | 49 declaration fragments, 64 omitted full declarations; 53 example fragments, 8 omitted tests |
| Packet checker | 0 errors, 0 warnings, using the pinned declaration index |
| Errata projection | `check_errata.check`: no errors |
| Reader/catalogue consistency | All 43 statements, hypotheses, proofs, acceptance checks, API/test specifications, source-match descriptions and inputs checked; all request and coverage text synchronized |
| Dependency checks | Packet proof graph acyclic; accepted restructuring/link overlay acyclic, including this packet’s projected supplier edges |
| Suggested Lean file | `lean-check`: exit 0 at Mathlib 082e2d3; 77 warnings, all declarations using `sorry` |

## Mathematical corrections and supplier bindings

The main new mathematical correction is `R24.6/residual-members(v)`. Crystallinity outside the system’s ramification set at odd ℓ is separate from the normalized Serre-weight calculation. The Fontaine–Laffaille formula needs an S-type residual member and a positive difference `1≤a−b≤ℓ−2`. At zero difference it cannot yield residual weight one: the unramified branch of the recipe gives weight ℓ. KW I §1 p.2 and §10.1 p.20 use the normalized Serre convention, and DP Lemma 1.14, proof p.9, states the unramified branch. The explicit R15.4 weight-comparison and tame-case exports were read. Their extension-sensitive Fontaine–Laffaille input remains with R07/R15.

The added acceptance example uses the standard two-dimensional rational representation of the S₃ splitting field of X³−2. Complex conjugation acts as a transposition, so the family over ℚ is odd; its actual Hodge–Tate weights are (0,0). For ℓ>3 its reduction is absolutely irreducible and unramified at ℓ, with normalized residual weight ℓ. This rejects the previous zero-difference formula. The cofinite rank-two irreducibility argument, its cyclotomic restriction bound and the Δ exception at ℓ=23 remain distinct from the general-rank BLGGT density-one result. Swinnerton-Dyer §2 Corollary 1 p.15 and §4 pp.31–33 support the Δ acceptance example.

`R24.4/kw-theorem-4-1` now imports the full `R22.5/kw-i-theorem-4-1-odd-prime` and `R22.6/kw-i-theorem-4-1-dyadic` nodes. KW I Theorem 4.1 p.7 cannot be deduced in full from the narrower Theorem 9.7 node alone. The odd-prime supplier retains a Kisin Durham proof gap for the non-ordinary crystalline endpoint k=p+1 with residual weight two. That gap is carried in the consumer request and stage remainder; this review does not accept or close the supplier’s own proof. The α/β consumer also names its full residual-witness exports directly. KW II §10.2 p.92 supplies the noncircular order: no R24.1–R24.3 lift-existence result enters this lifting import.

The R19 packet now has reviewed full Hilbert-family, away-coefficient and Skinner exports. The Brauer, almost-strict, coefficient-prime and strictness nodes bind those exports and `R19.2/hilbert-normalisation-dictionary`, rather than repeating requests to add mathematics already planned by that owner. The dictionary translates the actual geometric coefficient representation to the KW arithmetic member and includes the owner’s reviewed printed Hodge-degree shift (AutomorphicGaloisRepresentations/E4). Skinner Theorem 1 pp.241–243 has no residual-irreducibility, degree-parity or finite discrete-series restriction. BLGGT Theorem 2.1.1 pp.33–34 supplies the automorphic system comparison in its own convention; its away-coefficient strictness does not by itself prove the all-place KW assertion.

The historical KW proof and its withdrawn coefficient-prime inference remain visible. Full strictness of the constructed motivic Hilbert/Brauer families uses Skinner, the normalization dictionary and decomposition-field descent. Arbitrary almost-strict systems retain their limited contract. The R17.6 overlap-character proof leaf and R34.6 eigenform purity input remain separate requests.

Two suggested examples used unconstrained finite slots to imitate the absent arithmetic WD comparison. They were removed, with their original planned names retained as omitted tests. The reader and packet now check the differing definition obligations without claiming that those slots exhibit an arithmetic family failing strictness. The actual 61 planned arithmetic tests are retained.

Other edits are source-match wording, current supplier request/coverage descriptions and version-specific reading records. No node was added, no general definition was duplicated, and no supplier file or campaign document was edited.

## Source verification and version limits

All fourteen cited source files were fetched afresh on 8 October; their SHA-256 hashes match the packet. The independent passages read are listed in each source’s `readSections`, with this job identifier. The review checked the particular target statements and their proof dependencies; it does not claim to have independently reconstructed imported proof interiors.

The main source anchors are Böckle Proposition 1 p.2, Lemma 2 p.5 and Theorem 1 p.1; KW Annals Theorems 3.3/3.7 and Propositions 3.4/3.8 pp.239–242; KW I Theorems 4.1/5.1 pp.7–10, Lemma 6.2 p.11, §8.2 pp.13–15 and Theorems 9.1/10.1 pp.19–20; KW II §§10.2–10.3 pp.92–94; Snowden §§7.1–7.7 pp.20–23; Taylor §6 pp.773–774; BLGGT’s system, pairing, monodromy and residual-density sections; and ACC §7.1 pp.1084–1086,1092. Exact URLs, versions and hashes remain in the packet and reader. Results are recorded in the reviewers’ own words; no source passage was copied into a deliverable.

Two additional published versions were obtained and collated:

- [BLGGT, Annals 179 (2014), 501–609](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf): §5.1 p.572 and §5.2 pp.576,578–580. SHA-256 `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`.
- [Dieulefait–Pacetti, RACSAM 117 (2023), article 153](https://diposit.ub.edu/bitstreams/2e30a20d-5dd2-48e5-a27e-28c3f5fc241e/download): Theorem 1.11 and proof p.7, references 4/12 pp.15–16. SHA-256 `2a133808911a1819ea9480bea0bfc18846035f961e866ddec4d05d69b093e0f8`.

| Finding | Independent decision |
| --- | --- |
| E1 | KW II author preprint reference [33] p.96 has the wrong Duke page range. Published DP reference 12 p.16 confirms 557–589. The Inventiones KW II version remains unread. |
| E2 | BLGGT v1 pp.52–53 has an undefined finite polynomial product when w is odd. The corrected v4 Gamma quotients also appear in published §5.1 p.572; the elliptic-curve test gives Γℂ(s). |
| E3 | The derived-group quotient, simply connected integral-model and λ-isotypic notation slips persist in published pp.576,578–580. They do not invalidate the arguments. |
| E4 | Published ACC pp.1085–1086,1092 constrains extremely weak Hodge metadata only through determinant sums. The S₃ family over ℚ(i), with multisets {−1,1} and {0,0}, refutes full Hodge symmetry while preserving memberwise Artin-up-to-twist. Canonical Artin families and very weak realizations retain the intended purity. |
| E5 | Published DP Theorem 1.11 p.7 still cites Dieulefait 2004 Theorem 1.1. The cited arXiv theorem pp.1–2 assumes an odd prime, small positive odd weight difference and crystallinity. It does not justify arbitrary regular de Rham input. This is a citation-scope gap, not a counterexample to the family theorem. The Crelle text remains unread. |

The source issues each carry a fresh confirmed verdict naming this review. Correction searches found no matching correction for E3–E5; their dates and searched versions are recorded. Gee, Savitt and the original monodromy/density proof leaves remain the named gaps. No private-library source was needed.

## Baseline and library ownership

All 21 exact statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti is pinned to `f790474821cf4256814db967cb154e7af3d0c369`; this packet adds no declaration citation to it. The suggested file imports Mathlib only, so the successful shared-build elaboration checks the exact Mathlib pin without making a claim about a different shared Tau Ceti checkout.

| Declaration | Confirmed usable scope |
| --- | --- |
| `mathlib:RingTheory.Sequence.IsRegular` | Regularity includes weak regularity and a nonzero final quotient; parameter-system regularity is a separate R03 input. |
| `mathlib:IsLocalRing` | Local-ring predicate; does not supply completeness or Noetherianity. |
| `mathlib:ringKrullDim` | Krull dimension of the prime spectrum; provides the carrier for the requested height count. |
| `mathlib:Module.Flat` | Flat module predicate; its DVR torsion-free comparison remains the owner’s algebra. |
| `mathlib:Complex.Gammaℝ` | Γℝ(s)=π^(−s/2)Γ(s/2). |
| `mathlib:Complex.Gammaℂ` | Γℂ(s)=2(2π)^(−s)Γ(s). |
| `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one` | The meromorphic normalization identity Γℝ(s)Γℝ(s+1)=Γℂ(s), with no extra hypothesis. |
| `mathlib:Field.absoluteGaloisGroup` | Automorphisms of the algebraic closure, with the Krull-topological group instances. |
| `mathlib:Representation` | Algebraic monoid action by module endomorphisms; joint continuity is separate. |
| `mathlib:Representation.IsSemisimpleRepresentation` | Complemented lattice of subrepresentations; no arithmetic ramification condition. |
| `mathlib:Representation.IsIrreducible` | Simple order of subrepresentations, distinct from absolute irreducibility. |
| `mathlib:Representation.dual` | Contragredient on the module dual, using inverse group elements; requires a group. |
| `mathlib:NumberField.FinitePlace` | Adic finite places with the nonzero-prime dictionary; not an arbitrary prime label. |
| `mathlib:NumberField.FinitePlace.embedding` | Canonical field embedding into the prime-adic completion over a Dedekind coefficient ring. |
| `mathlib:LinearMap.charpoly` | Characteristic polynomial for finite free modules over a commutative ring, hence for the vector spaces used. |
| `mathlib:Representation.ind` | Group induction along a group homomorphism, algebraically via coinvariants; narrowed the description from an unrestricted monoid reading. |
| `mathlib:Rep.indResAdjunction` | Induction–restriction adjunction for groups over a commutative ring; no arithmetic Brauer descent is inferred. |
| `mathlib:MvPowerSeries` | Actual multivariate power series with finitely supported monomial exponents. |
| `mathlib:IsDiscreteValuationRing` | DVR structure with a nonzero maximal ideal, excluding fields. |
| `mathlib:IsAdicComplete` | Ideal-adic Hausdorffness and precompleteness of the module. |
| `mathlib:Finsupp` | Finite-support functions; additive multiplicities only, not pointwise tensor multiplication. |

No baseline citation was removed or replaced. The reviewed audit has no dedicated compatible-systems row. The relevant G7, R01.1 and R19.3/R19.5 rows were read: their missing arithmetic refinements do not turn the elementary Mathlib carriers into a compatible-system library. Upstream InductionRestriction and SemisimpleAlgebras were read as granularity/API models. GlobalNumberFields Layers 9–10 own Hecke characters and algebraic infinity-type purity; ClassFieldTheory Layers 11–12 own global reciprocity, with its Layer 9 owning the local Weil group. The algebraic ℓ-adic character comparison remains a requested Part II interface. No upstream roadmap is re-planned here.

## Closure, earlier review and red-team findings

Each direct named supplier statement was read, and all 26 requests were checked against the exact consumers listed in `neededBy`. Every named consumer includes its supplier as a direct node or stage input. A supplied blueprint is an import contract, not a compiled implementation or a claim that its original proof leaves have been read. In particular, R03’s existing minimal-generator theorem is insufficient for Böckle’s full parameter-system argument, and the R22 auxiliary comparison is requested with its finite-flat hypothesis.

The accepted restructuring/link overlay has 1,962 stages and 7,195 edges and is acyclic. RS-12 adds its 28 links without skipping an endpoint. Projecting all this packet’s direct supplier edges to their layers preserves acyclicity. The early operations nodes have no eigenform, potential-modularity or eigenform-purity prerequisite. No chronological stage ordering is used as a proof input.

All earlier review corrections were checked, including the reader’s full-field synchronization, the cofinite rank-two residual conclusion, the DP scope restriction, the R23.5 disjointness input, the all-weight WD crystallinity criterion, the linked-system table’s missing choices, dyadic/Savitt qualifications, absolute-reducibility terminology, polarized CM constituent hypotheses, genuine uses lists and owner routing. The revision is no longer blocked on an uneditable reader.

| Confirmed red-team finding | Result |
| --- | --- |
| /10 | Generic carriers and operations precede R19 eigenform families and R34 purity. Definitions do not depend on their existence theorems. |
| /12 | R24.4 consumes the full R22 exports. Neither the residual-witness nor lifting proof uses R24 finiteness/lift existence. The endpoint supplier gap is visible. |
| /21 | R24.6 owns reduction and local-hypothesis checks; modern de Rham transfer stays with R32.6. |
| /30 | The full Skinner supplier and its normalization dictionary upgrade the constructed Brauer families. The historical almost-strict contract is retained separately. |

The API outlines cover actual carriers, constructors/projections, coefficient change, recognition up to isomorphism, polynomial/Hodge formulas, operations, pairing signs, Grothendieck pairing and their preservation conditions. The planned tests include degeneracies and nonexamples: forbidden dyadic parity, absent level-two characters, nonzero Steinberg monodromy, repeated Hodge weights, reducible tensors, mixed purity weights, zero pairings and the determinant-only E4 metadata defect. The suggested fragments do not replace missing arithmetic predicates by arbitrary proposition fields. Their `sorry` proofs remain planning placeholders, and omitted arithmetic tests are not counted as elaborated tests.

## Node decisions

These are the same independent decisions recorded in `review.checked`.

| Node | Verdict and reason |
| --- | --- |
| `R24.3/bockle-presentation` | **verified**. Böckle Proposition 1 p.2 and KW Annals Proposition 3.4 p.240 match the fixed/variable determinant dimension count. The presentation and local-condition inputs are supplied by R04/R08, not proved again here. |
| `R24.3/finite-presentation-complete-intersection` | **verified**. Böckle Lemma 2 p.5 requires a nonzero finite quotient and at most n relations over the n-variable DVR power-series ring. Its parameter-system regularity input is explicitly requested from R03.3; the earlier review’s nonzeroness correction is preserved. |
| `R24.3/bockle-minimal-r-equals-t` | **verified**. Böckle Theorem 1 p.1 assumes the auxiliary finite-flat R_Q=T_Q comparison. The R22.3 request carries that precise hypothesis; this is not an unconditional lift-existence theorem. |
| `R24.3/kw-annals-minimal-lifts` | **verified**. KW Annals Theorem 3.3 pp.239–242 has p>2, cyclotomic absolute irreducibility, 2≤k≤p+1 and k≠p. The dimension, finiteness and finite-flat conclusions and the corrected Khare–Ramakrishna bibliography locator agree. |
| `R24.3/required-lift-types` | **verified**. KW I Theorem 5.1 pp.9–10 gives the four local types, auxiliary characters and dyadic parity restrictions. The genuine level-two and automatic-minimality qualifications are retained; R08/R04 own the local conditions and point recognition. |
| `R24.3/theorem-5-1-part-1-minimal-crystalline` | **verified**. KW I Theorem 5.1(1) p.9 and KW II §10.3.1 p.92 give minimal crystalline lifts, with k=2 in the dyadic branch. Local nonemptiness, global dimension, finiteness and characteristic-zero-point inputs remain separate. |
| `R24.3/theorem-5-1-part-2-weight-two` | **verified**. KW I Theorem 5.1(2) p.9 and KW II §10.3.1 p.92 give weight-two lifts, with nonzero monodromy at the endpoint and the distinct dyadic weight-four branch. |
| `R24.3/theorem-5-1-part-3-level-one-type-at-q` | **verified**. KW I Theorem 5.1(3) p.9 has q∥N, p|(q−1) and a specified lifting character with the dyadic parity condition. The residual-weight conclusion for the new coefficient member belongs to the separate systems node and Savitt request. |
| `R24.3/theorem-5-1-part-4-level-two-type-at-q` | **verified**. KW I Theorem 5.1(4) p.10 has the level-two p-power character and p|(q+1); its local nonemptiness is imported. No good-dihedral condition is inferred solely from the numerical divisibility. |
| `R24.3/theorem-5-1-application-table` | **verified**. KW I §8.2 pp.13–15 confirms both lift choices in the linked-system induction. DP Theorem 1.9 p.6 separates the classical KW branches from the modern prescribed-type branch. The revision retains the earlier review’s restored cases. |
| `R24.3/modern-prescribed-type-lifts` | **verified**. Snowden §1.4 p.3, §3.1 p.6 and Theorems 7.2.1/7.6.1 pp.21–23 require actual local solutions and the specified extension of types. The plan correctly excludes arbitrary nonempty-looking type labels and the dyadic case. |
| `R24.4/alpha-beta-from-residual-modularity` | **corrected**. KW II §10.2 p.92 is a consumer of residual weight witnesses and earlier lifting. Added direct bindings to R22.5/alpha-beta-from-modularity-over-q and kw-residual-modularity-beta; no R24 lift-existence theorem enters the proof. |
| `R24.4/kw-theorem-4-1` | **corrected**. KW I Theorem 4.1 p.7 is broader than the odd-prime Theorem 9.7 export. Replaced the narrow lifting dependencies with the full R22.5/R22.6 exports and carried the odd-prime non-ordinary endpoint gap in coverage and its request. |
| `R24.5/compatible-system` | **corrected**. KW I §5 pp.7–8 and DP Definition 1.10 p.7 distinguish plain, almost strict and strict contracts. Removed the unsupported claim of strict logical separation by an actual arithmetic family, and omitted its finite-slot Lean surrogate. |
| `R24.5/system-operations` | **verified**. KW II §10.3.2 p.93 uses twisting, restriction and finite-index induction of actual representations. The general continuous representation operations remain imports from R01.1/G7; preservation conditions and four tests are explicit. |
| `R24.5/brauer-induction-system` | **corrected**. KW II §10.3.2 p.93 and Khare arXiv Proposition 3.1 pp.16–17 require norm one, not degree two alone, for Brauer genuineness. Bound the current R19.3 family and R19.2 normalization exports; the overlap-character proof leaf remains requested from R17.6. |
| `R24.5/almost-strict-compatibility` | **corrected**. KW II pp.93–94 retains its historical residual-irreducibility restriction. Replaced stale supplier commentary by explicit current full Skinner, away-coefficient and normalization imports for the modern route; preserved R23.5 disjointness and the historical proof distinction. |
| `R24.5/kw-theorem-5-1-systems` | **verified**. KW I Theorem 5.1 pp.9–10, Theorem 9.1 p.19 and KW II p.94 support the family construction and dyadic branch. Savitt’s exact residual-weight calculations remain an honestly unread R15.4 supplier leaf. |
| `R24.5/dieulefait-families` | **verified**. DP Theorem 1.11 p.7 is quoted only as a source assertion; the planned family theorem is restricted to the R23.4 KW types. Dieulefait 2004 Theorem 1.1 pp.1–2 is narrower, and the extra potentially Barsotti–Tate/general de Rham scope remains a recorded gap. |
| `R24.6/residual-members` | **corrected**. Preserved KW I §8.4 p.17 and Theorem 10.1 p.20 cofinite rank-two irreducibility and Lemma 6.2 p.11 cyclotomic bound. Corrected (v) to positive Fontaine–Laffaille weight difference and S-type residual input; added the unramified equal-weight Artin branch of Serre weight ℓ, explicit R15.4 inputs and an S₃ acceptance check. |
| `R24.6/local-compatibility-at-the-coefficient-prime` | **corrected**. KW I §5 p.8 and DP Paso 5 p.14 do not give a WD assertion for an arbitrary residual-reducible ramified coefficient member. Clarified those clauses and bound full Skinner only for the constructed strict Hilbert/Brauer families; the all-weight crystalline criterion is R06.3. |
| `R24.6/linked-systems-modularity-transfer` | **verified**. KW I §8.2 p.15 and DP Remark 4 p.7 support memberwise recognition/classical transfer. The modern ramified residual-reducible de Rham branches are imported from the three R32.6 nodes, without a second lifting theorem in R24.6. |
| `R24.5/weakly-compatible-system-rank-n` | **corrected**. BLGGT v1 §5.1 p.51 and Taylor §6 p.773 require actual semisimple members, common polynomials and labeled Hodge data. Replaced the stale source-match wording by a direct description; carrier and recognition scope are otherwise verified. |
| `R24.5/compatible-system-predicates` | **corrected**. BLGGT v1 pp.51–53 and v4 pp.62–63 distinguish regularity, purity with Hodge symmetry and away-coefficient strictness. Clarified the missing KW coefficient obligation and omitted its artificial finite-slot Lean example; no arithmetic counterfamily is asserted. |
| `R24.5/linear-algebra-operations-on-systems` | **verified**. BLGGT v1 §5.1 pp.51,53 gives the system operations. Tensor, dual, powers and restriction carry the stated polynomial/Hodge formulas, while irreducibility, regularity and polarization require their own hypotheses. The five tests detect these failures. |
| `R24.5/rank-two-reducibility-independent-of-lambda` | **verified**. Taylor Lemma 6.5 and surrounding discussion pp.773–774 concern absolute reducibility of rank-two systems over ℚ and the character decomposition alternatives. The earlier review’s absolute qualifier and scope restrictions remain synchronized. |
| `R24.5/system-l-functions` | **verified**. BLGGT v1 pp.52–53 and v4 pp.63–64 were compared. The plan uses the corrected Gamma quotients and d± signs, imports finite-place constants from ET.6, and keeps analytic continuation/functional equations out of the carrier definition. |
| `R24.5/galois-grothendieck-ring` | **verified**. BLGGT v1 §5.4 pp.61–63 gives the irreducible multiplicity lattice, tensor multiplication and Hom pairing. The norm-one positive-dimension criterion is the genuine Brauer step; Finsupp pointwise multiplication is not used for tensor product. |
| `R24.5/residual-irreducibility-density-one` | **verified**. BLGGT v1 Proposition 5.2.2 pp.54–58 and v4 Proposition 5.3.2 pp.71–74 give density-one irreducibility of cyclotomic restrictions of constituents. The plan retains regularity and does not upgrade this general-rank conclusion to cofinite. |
| `R24.5/constituents-essentially-self-dual` | **verified**. BLGGT v4 Lemma 5.4.5 p.76 has a pure extremely regular polarized system over imaginary CM F and a finite extension. The actual polarization pairing/sign import and the intermediate CM-field conclusion are retained; abstract self-duality alone is insufficient. |
| `R24.5/larsen-rational-system-groups` | **verified**. BLGGT v4 §5.2 pp.65–66 defines the restriction-of-scalars member, Zariski closure and its center/derived/simply connected/torus groups. The construction imports G7 geometry and does not silently assume connected monodromy. |
| `R24.5/serre-theta-uniform-bounds` | **verified**. BLGGT v4 Lemma 5.2.1 pp.66–67 gives the lattice-index and Hodge-character bounds after the specified finite extension. The constant depends on the system; the cyclotomic-power test correctly rejects a bound uniform over all systems. |
| `R24.5/larsen-good-primes` | **verified**. BLGGT v4 Proposition 5.2.2 pp.68–70 isolates the density-one good-prime and integral-model conclusions. The original Larsen/Larsen–Pink/Bruhat–Tits/Serre inputs remain named unread leaves, rather than being claimed proved. |
| `R24.5/strict-brauer-system` | **corrected**. Skinner Theorem 1 pp.241–243 supplies full coefficient-prime compatibility; BLGGT Theorem 2.1.1 pp.33–34 alone does not. Bound full R19.4/R19.5 exports and the R19.2 normalization dictionary, including its reviewed printed Hodge-degree correction; retained decomposition-field descent and separate purity ownership. |
| `R24.5/monodromy-component-field` | **verified**. BLGGT v4 Lemma 5.3.1 pp.70–71 and Lemma A.1.5 p.85 require the connected-component field and split-eigenvalue coefficient-descent criterion. Trace descent alone would have a Schur-index obstruction. The Sen/Larsen–Pink proof leaves remain recorded. |
| `R24.5/polarized-system` | **verified**. BLGGT v4 §2.1 p.31 and §5.1 p.62 require an actual perfect pairing with multiplier and sign. G7 supplies representation-level polarization; the system-level construction and tests retain the zero-pairing exclusion and the distinct CM/TR cases. |
| `R24.5/polarized-operations` | **verified**. BLGGT’s pairing convention and the read G7 export give the CM quadratic correction for tensor/power multipliers. The unit, tensor sign and common-multiplier direct-sum tests agree; regularity and irreducibility are not automatically preserved. |
| `R24.5/character-system` | **verified**. BLGGT v4 Appendix A.2 p.87 and ACC §7.1 pp.1085,1092 use algebraic Hecke characters and their actual ℓ-adic members. GlobalNumberFields Layers 9–10 own the characters; the reciprocity realization/classification refinement remains ClassFieldTheory Part II. |
| `R24.5/rank-one-purity` | **verified**. BLGGT Appendix A.2 p.87 relates conjugate infinity exponents and good Frobenius weight. The plan imports the global character purity and reciprocity dictionary rather than re-proving them; cyclotomic sign and finite-order examples agree. |
| `R24.5/induced-character-purity` | **verified**. ACC §7.1 p.1092 and BLGGT v4 pp.62–63 support induced character purity when every conjugate branch has the common weight. Mackey/Frobenius reciprocity are upstream imports, and the mixed-weight negative example is necessary. |
| `R24.5/artin-system` | **verified**. ACC §7.1 pp.1086,1092 constructs the family of an actual finite-image representation with canonical zero Hodge data. Its conductor, induction and weight-zero tests are meaningful; arbitrary metadata are not substituted for the Artin constructor. |
| `R24.5/artin-twist-purity` | **verified**. ACC’s Artin-twist observation is valid for the canonical Artin tensor character constructor with its actual Hodge multisets. The plan explicitly excludes the extremely weak metadata inference refuted by E4. |
| `R24.5/weakened-compatible-data` | **verified**. ACC §7.1 pp.1084–1085 separates very weak de Rham/Hodge data from extremely weak determinant-only data. Its forgetful maps, genuine uses and the E4 multiset counterexample match the revised source contract. |

## Questions and next work for the orchestrator

No further change to this review is required for acceptance. The following work remains with the named owners:

1. Keep the R22.5 non-ordinary endpoint proof leaf visible until its owner discharges it; the full export’s existence is not evidence of proof closure.
2. ClassicalSerreModularity R33 must feed only the planned KW-type scope into `dieulefait-families`, or obtain potential modularity for the additional potentially Barsotti–Tate and general regular de Rham inputs recorded in the seventh gap.
3. Carry the current full R19 family/Skinner exports and normalization dictionary into consumers. Retain the overlap-character proof obligation and coefficient-signature realization requests rather than duplicating owner definitions.
4. Follow up the seven recorded source/proof/signature gaps, including Savitt weights, parameter-system algebra, monodromy/density originals and the ClassFieldTheory Part II character comparison. No supplier was edited or promoted by this worker.
