# RT-AREA-ktheory-1: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #3979, job FIX-RT-AREA-ktheory-1).
This continues Codex session codex-5ebb6f's checkpoint (#4644). Its ledger is
`research/blueprint/handoff/FIX-RT-AREA-ktheory-1.md`.
- **Findings:** `RT-AREA-ktheory-1.result.json`.
- **Verdicts:** `RT-AREA-ktheory-1.review.json`. Of the 38 high and medium findings, 37 were confirmed
  and one, /38, was rejected. The low findings (40–49) are not part of this job. Where the verifier
  corrected or narrowed a fix, I applied its version.
- **Independence.** I did none of the blueprints edited here, their reviews, the red team or its
  verification.
- **How the work was split.** I split the packet edits among five parallel workers of this session, one
  per packet group. Then I integrated them:
  - checked every diff;
  - resolved one stage cycle myself and had another removed (see "Stage order" below);
  - ran all the checks.

## How the findings are handled

By PROTOCOL.md section 17, a finding about a roadmap's plan is fixed in that roadmap's blueprint.
- **Finished blueprint.** It is fixed here, in the blueprint's packet, reader and suggested file. Seven
  finished blueprints are this job's deliverables:
  - ArithmeticKTheory--N.1 (N.1–N.6);
  - ArithmeticKTheory--N.7 (N.7–N.8);
  - GeneralAlgebraicKTheory--K.1 (K.1–K.5);
  - GeneralAlgebraicKTheory--K.6 (K.6–K.7);
  - K2SymbolsBrauer--T.1 (T.1–T.2);
  - K2SymbolsBrauer--T.3 (T.3–T.7);
  - K3BlochGroups (V.1–V.6).
- **Unwritten blueprint.** It is handed to the blueprint job that will write it, and that job's prompt
  lists it. I recomputed the assignment from `make_queue.py`'s routing against the current queue.
- **Maintainer's changes.** Atlas stage edges and changes to base stage texts cannot be made by a job.
  Each is a note for the maintainer below. The packets also record them in their `restructure` and
  `requests` entries.

**Blueprint jobs and their issues:**

| Job | Issue |
|---|---|
| BP-BorelRegulators | #74 |
| BP-MotivicEtaleKTheory--M.1 | #957 |
| BP-MotivicEtaleKTheory--M.5d | #959 |
| BP-StableHomotopyKTheory | #999 |
| BP-SpecialValuesBirchTate | #998 |
| BP-KTheoryLowDegrees--U.1 | #764 |
| BP-KTheoryLowDegrees--Z.3 | #765 |
| BP-SchemeKTheoryOperations | #987 |
| BP-KTheoryFiniteLocalFields | #763 |

**The checkpoint.** The checkpoint's appendix patch to `content/` and `data/decompositions/` is not
applied: base files are not job outputs. Where its content concerns a finished blueprint, the packet edits
below carry it. Otherwise it appears as a maintainer note.

## Fixed in the finished blueprints

### ArithmeticKTheory (N.1–N.8)

- **/1 (high): Quillen's finite generation.**
  - N.3:finite-generation now owns the Q-construction rank filtration and its spectral sequence (six new
    nodes, from Kahn, arXiv:1108.2441v3 §4, read):
    - `rank-filtration`;
    - `layer-poset`;
    - `comma-category-is-the-layer-poset`;
    - `layer-poset-is-the-suspended-building`, with ranks 1 and 2 explicit;
    - `rank-spectral-sequence`, which is Quillen's Theorem 3;
    - `steinberg-homology-of-automorphism-groups`, covering nonfree P by commensurability.
  - N.3:finite-generation also owns the assembly (`quillen-finiteness-criterion`) and the finite-S step.
  - BorelRegulators R.1 is the single owner of the building, Solomon–Tits, the Steinberg module and
    integral finiteness. The finiteness uses the verifier's twisted dualizing module
    St_n(F) ⊗ ℤ_χ^{⊗(n−1)}, χ = N∘det (Putman–Studenmund Theorem C, read), or descent through a torsion-free
    subgroup. The R.1 request is rewritten to say this.
  - The "arithmetic-group finiteness and finite-type homotopy" clause and its gap are gone.
  - Quillen 1973 itself was not obtainable (paywall). Its Theorem 3 is used as Kahn states it, and the node
    says so.
  - Handed on: R.1's side, to #74.
- **/3 (high): the real place.** `N.5/the-real-case-modulo-eight` uses only M.7's dyadic output, the
  real-place maps and the extension data. The M.7 request names Suslin's K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m)
  (K-book VI.3.1) and real topological K-theory as M.7's inputs. N.5 now states that it redoes no dyadic
  calculation.
  - Handed on: M.7 to #959.
  - RefinedTraceMethods RT.4 (KO/BO, real Bott periodicity, realification) needs a maintainer note: no
    unwritten blueprint job carries it.
- **/7 and /24 (consumer part): ranks.**
  - `N.3:ranks/borel-rank-theorem` is narrowed to the passage 𝓞_F → 𝓞_{F,S} for n ≥ 2, through N.2's
    localisation and L.1. The 𝓞_F rank is imported from R.3.
  - The degree-one exception uses U.4's S-unit theorem, requested from U.4.
  - New node `even-K-groups-of-S-integers-are-finite` states finiteness for the ring only. It records the
    K-book VI.8.1 field misprint (E15) rather than copying it.
  - Handed on: R.3's narrowing to #74; U.4's S-unit theorem (/24) to #764.
- **/8 (consumer part).** N.6 cites M.3, not T.7, for Tate's K₂/m ≅ H² theorem. The M.3 and T.7 requests in
  both packets are updated.
- **/9: the degree-two tame-kernel row.**
  - N.2 imports the degree-two tame-kernel rows from T.5: the tame-kernel sequence, the S-integer sequence
    and the relative sequence.
  - N.6 owns the certificate engine. New node `N.6/order-certificate` takes over the deleted
    `T.5/certified-presentation`, and the cohomological lower bound covers every even degree.
  - N.8 imports K₀(ℤ) from Z.6, K₁(ℤ) from U.6, and K₂(ℤ), K₂(ℚ) from T.5.
  - N.8 keeps K₂(ℤ[i]) = 0, the real-quadratic certificate and the ℤ[1/p] sequence, now in every degree.
- **/10.** N.4's W₂ nodes (invariants of ℚ/ℤ(2)) are exportable, and positivity is stated. Finiteness of
  K₂(𝓞_F) is the new N.3:ranks node.
  - Handed on: B.1's side to #998.
- **/11: the real-quadratic certificate.** `N.8/real-quadratic-example-and-birch-tate` is now the
  certificate for ℚ(√5), K₂(𝓞_F) ≅ (ℤ/2)², the field B.3 checks.
  - The lower bound comes from the two real sign symbols.
  - The upper bound (generation) is a recorded gap: Browkin–Schinzel was not obtained.
  - No Birch–Tate input is used. `N.8/birch-tate-status` was deleted: it imported B.3 and would close a
    cycle once B.3 imports N.8.
  - Handed on: B.3's side to #998.
- **The readers.**
  - The N.1 reader described a pre-review packet: it named 13 nodes that no longer exist and missed 25
    that do. So it was re-rendered from the packet.
  - In the N.7 reader, the N.8 sections were re-rendered.
  - The Lean edits are comments only.

### GeneralAlgebraicKTheory K.1–K.5

The checkpoint had partly fixed /4, /15, /19, /20 and /21 and corrected /31. Each was verified and
completed.

- **/4 (high): additivity and the relative S-fibration belong to K.4:construction.**
  - The K-theory-space node no longer claims the infinite-loop structure; that is H.5:S-delooping's
    assembly.
  - The S-construction cites Tau Ceti's `ExactStructure.ConflationCategory`, not the unrelated
    extension category EA.
  - Late K.4 keeps fibration, approximation and Gillet–Waldhausen, and drops "the delooping theorem".
  - `iS-versus-Q` stays early, because it needs neither additivity nor the delooping. The verifier keeps
    late only the comparisons that do.
  - Handed on: H.5's side to #999.
- **/15: the realization theorem.** `K.4/delooping-and-the-spectrum` cites StableHomotopyKTheory H.2's
  realization theorem for levelwise fibrations. The H.2 request states that theorem precisely. The node's
  proof checks each of its hypotheses for the relative S-construction:
  - the levelwise split fibrations;
  - connected base terms;
  - good simplicial spaces.

  It also identifies the fibre map and the basepoint.
  - A misprint found in K-book V.1.7's proof, which swaps B and C, is recorded in `sourceIssues`.
  - Handed on: H.2 to #999.
- **/18 (K.5 part): Milnor squares.**
  - KTheoryLowDegrees Z.1 already plans Milnor patching and three of the four exactness positions, so
    these are imported.
  - New nodes `K.5/milnor-square-K1-exactness` and `K.5/milnor-square-mayer-vietoris` give the K₁–K₀
    sequence with classical K₁, with no higher excision.
  - The missing position is planned in K.5 rather than requested from U.5, because U.5 and U.6 lie
    downstream of K.5.
  - `K.5/relative-K-theory` no longer claims the classical low-degree identification. That is U.6's.
- **/19: the ring model.**
  - `K.2/functorial-K-theory-of-a-ring` is the single ring-model node. It covers:
    - the pinned finite-projective exact category;
    - scalar extension through Z.1's noncommutative functor;
    - products;
    - filtered colimits through idempotent matrices;
    - K(R^op).
  - Ring clauses are gone from the generic K.1 nodes.
  - `K.2:plus/cofinality-of-projective-modules` uses group-completion cofinality (H.4), not the late
    cofinality theorem.
- **/20: splitting K.3.**
  - Early K.3 now depends only on K.1, H.1/H.2 and the pinned API. New nodes cover the 3×3 lemma and the
    exact category of conflations.
  - `K.3/cofinality-degree-zero-correction` keeps its id and records `proposedParentStageId`
    K.3:cofinality, placed after K.4.
  - K.4 → K.5 is kept.
  - Weibel's known erratum is recorded: Waldhausen cofinality needs a saturated subcategory.
- **/21: the pinned carriers.** `ExactStructure`, `ExactK0` (`of`, `of_conflation`, `lift`, `hom_ext`) and
  the finite-projective exact structure are cited, and each was checked at the pins.
  - No node uses Quillen's axiom (c), so no dictionary lemma was needed. The Q node records Bühler 2.16's
    cokernel hypothesis.
  - π₁(BQ) ≅ ExactK0 is proved through `ExactK0.lift`, with the universe hypotheses kept.
- **/31.** The checkpoint's correction (the affine plane with doubled origin) was verified in the packet,
  the reader and the suggested file, and left unchanged.
  - Handed on: the consistency of KTheoryLowDegrees Z.5's "K₀ ≅ ℤ ⊕ Pic for regular curves" with this
    example, to #765.

### GeneralAlgebraicKTheory K.6–K.7

- **/4 (K.7 part).** `K.7/products-from-biexact-functors` is the only owner of the biexact pairing and its
  coherence.
  - The generic smash product is requested from H.5:spectra.
  - H.5:S-delooping is asked only for assembly.
- **/17: the projective line and Nil groups.**
  - New nodes cover:
    - the projective line over an associative ring, as the gluing category of projective modules (not
      Spec R);
    - K(R) × K(R) ≃ K(P¹_R);
    - the Nil category and groups;
    - the localisation sequences at t;
    - Nil_n ≅ NK_{n+1};
    - the fundamental theorem in positive degrees, and its splitting by multiplication by [t].
  - The fundamental theorem node assembles them. Its S.5 prerequisite, a cycle, is removed.
  - The scheme clauses of the agreement node (IK_i(X) = K^B_i(X) for qcqs X; vanishing of negative
    G-theory) are handed to SchemeKTheoryOperations S.5 and S.2 by request. S.5 and S.2 import the ring
    theorem.
  - The same cycle through S.6 was removed from `K.7/graded-commutativity`.
  - Handed on: S.2 and S.5 to #987.
- **/18 (K.6 part).**
  - `negative-k-groups` states K_{−n} = Lⁿ K₀. New nodes prove that K₁, K₀ and every K_{−n} are contracted,
    and that π_{−n} of the Bass spectrum is K_{−n}.
  - Mayer–Vietoris continues into negative degrees under the Milnor-square hypotheses.
  - The spectrum-form node (retitled "Excision for a Milnor square in degrees at most zero") proves:
    - the isomorphism on π_n for n ≤ 0;
    - the classical degree-one surjectivity.
  - The spectrum-form degree-one surjectivity needs the relative comparison π₁K(R, I) ≅ GL(I)/E(R, I),
    which is U.6's and downstream of K.6. It is therefore handed to U.6 by request.
  - Handed on: U.6 to #764.
- **/19 (K.6 and K.7 part).** K.6 and K.7 import the ring model and the K.1 nodes. The K.7 colimits and
  products node keeps only the nonconnective refinements.
- **Also corrected in these files:**
  - two K.7 statements that contradicted the earlier review: "a unit acts as an automorphism" and
    "derivation";
  - a false Lean statement, `mul_unit_bijective`, which becomes `mul_unit_inv_eq_neg`;
  - the reader, which had never been re-rendered after the review.

### K2SymbolsBrauer T.3–T.7

- **/28: norms before the localisation comparison.**
  - The elementary norm/residue identities were already T.4 nodes before Kato's transitivity. Ex. III.7.8
    (`higher-ramification-formula`) joins them.
  - The finding's edge T.4 → T.3:localization-comparison would have closed a 2-cycle with the packet's
    earlier proposal T.3:localization-comparison → T.4. That proposal existed because T.4's Bass–Tate
    sequence uses the higher Milnor residues. So the eight residue nodes are re-parented to T.3:symbols,
    which already precedes T.4. They still realise T.3:localization-comparison.
  - T.3:localization-comparison constructs no transfer. It imports Milnor norms from T.4, and Quillen
    transfers from `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula` and
    `K.3/resolution-theorem`.
  - New nodes:
    - the Dedekind localisation boundary (K-book III.6.5, V.6.6);
    - the Quillen norm/residue square (V.6.6.3–6.6.4);
    - the Milnor = Quillen transfer comparison on K₂. This is proved for quadratic extensions; the
      general case is a new gap.
- **/12: norms and reciprocity in all degrees.**
  - `T.4/weil-reciprocity` is now Suslin's reciprocity law in all degrees. It is stated for a proper curve
    over any field, over the regular proper model, with Kato's norms on possibly inseparable residue
    fields, and without smoothness, as the verifier requires.
  - The finiteness of integral closures it needs is pinned only in the separable and purely inseparable
    cases. The general case is a new gap.
  - Kato's independence is `T.4/milnor-transfer-transitivity`.
  - Handed on: M.4 to #957.
- **/32: the curve suppliers.**
  - `T.4/valuation-comparison` imports AlgebraicCurves Layer 12 (12A, 12B, 12D), keeping "regular, not
    smooth". Link AC-L40 already exists, as the verifier noted.
  - New `T.4/disjoint-support-reciprocity` shows that the symbol form gives EllipticCurves Layer 2's
    f(div g) = g(div f), through the residue-field norms and the tame-symbol sign. It is checked on
    y² = x³ − x over ℚ with degree-two places.
- **/26: T.5's inputs.**
  - T.5 derives its rows from the Dedekind node, U.4's SK₁(𝓞_{F,S}) = 0 (by request) and
    `T.2/k2-finite-field`.
  - The verifier's indexing is applied. The S-integer sequence has residues at primes outside S. The new
    `T.5/relative-s-integer-sequence` has residues at primes in S.
  - T.5 no longer imports N.2, which would be a cycle now that N.2 imports T.5.
- **/9 (T.5 part).** `T.5/certified-presentation` was deleted; its content is `N.6/order-certificate`.
  T.5 no longer needs the finite-generation theorem.
- **/8: T.7 and the Galois symbol.**
  - The M.3 request makes M.3 the single owner of three things:
    - the general-field Galois symbol with the Steinberg relation;
    - its Chern description;
    - Tate's local, global and S-integer theorems.
  - `T.7/chern-class-agreement` is kept only as a compatibility with the imported map and classes, as the
    verifier asked.
  - Handed on: M.3 to #957.
- **/27: T.7's other imports.**
  - The CFT Layer 5 and 10 links (CFT-L68/L69) are kept and not called absent.
  - New requests go to:
    - CFT Layer 14 (quadratic law);
    - QuadraticFormInvariants 6E and 7B;
    - ClassicalArithmeticCompletion CA.1 (m-th power reciprocity).
  - `T.7/global-reciprocity` is now an adapter over them. The primitive root and the twist pairing are
    explicit. No L.3 → T.7 dependency is added.
  - Tau Ceti stage ids cannot be node prerequisites, because the checker reads `tauceti:` as a pinned
    declaration. They are imported through requests.
- The reader was re-rendered from the packet; it still described the 22-node pre-review packet.

### K2SymbolsBrauer T.1–T.2 and K3BlochGroups

- **/30: the recognition theorem.** T.1:classical now has 17 new nodes, one per declaration:
  - pullback and composite of central extensions;
  - splitting over a universal source;
  - H₁ as abelianisation, and perfectness;
  - superperfect groups;
  - existence of a universal central extension for every perfect group;
  - Hopf's formula through the four-term sequence (Löh, read);
  - its naturality;
  - ker = H₂(G; ℤ);
  - the four implications of the recognition theorem;
  - lifts, and naturality on kernels.

  Perfectness and centrality are kept as hypotheses. The recognition gap is closed. Hopf's formula still
  needs the low-degree Hochschild–Serre sequence for discrete groups, which no stage or library has; that
  is recorded as a gap.
  - Handed on: H.3's import to #999.
- **/29: the Steinberg group in V.1.** V.1 no longer proves superperfectness. Three V.1 nodes moved to
  T.1:classical (`uce-superperfect`, `central-extension-comp`, `split-extensions-kill-h2`), and V.1 imports
  St(A) → E(A) and the recognition corollary. V.1 keeps:
  - BSt(A)⁺;
  - the connected-cover comparison;
  - the Hurewicz step;
  - the bar-cycle model.
- **Lean.** Both suggested files were compiled against the Mathlib pin: the additions give only `sorry`
  warnings. The T.1 file keeps five errors that were there before this fix, where the Steinberg group's
  commutator bracket is not found. They are outside these findings.
- **Also changed, following /28.** `T.2:symbols/extension-kernel-torsion` asked T.3:localization-comparison
  for the K₂ transfer. That stage now imports the transfer, and the prerequisite closed the stage cycle
  T.2:symbols → T.3:localization-comparison → T.2:symbols. It now cites
  `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`: by the projection formula,
  transfer ∘ restriction = [L:F]. Its request and gap are updated.

## Handed to blueprint jobs only (no finished blueprint concerned)

| Finding | Carried by | Verifier's binding correction |
|---|---|---|
| /2 (high) | M.1 (#957), M.5d (#959) | A source-level Beilinson–Lichtenbaum node after the norm-residue engine, with topology, naturality and degree conventions and the passage to smooth schemes. The Dedekind-base version is separate. |
| /5 (high) | BorelRegulators (#74), StableHomotopyKTheory (#999) | H.3 owns the simple-space homological Whitehead theorem, H-space simplicity and the scoped obstruction argument; add H.3 → H.4. Rational Hurewicz has one owner, H.6 (/33). |
| /6 (high) | BorelRegulators (#74) | Borel 1977 §§2.2–2.4: SL₁(D) split at ∞, strong approximation and its Tamagawa volume. τ = 1 is sufficient; the requirement is rational proportionality. Import AA.3 and the Brauer interfaces. |
| /13 | M.5d (#959) | An early differential-symbol/BGK node, with classical Cartier (DD.3) and dlog/W_rΩ_log (CR.4). Mod p is separate from the prime-power extension. Arbitrary imperfect fields are included. |
| /14 | M.1 (#957) | ProfiniteCohomology Layer 9 Kummer import, and a shared early general-field Galois-symbol node consumed by M.3 and M.5c. |
| /16 | StableHomotopyKTheory (#999) | H.5:spectra: EM spectra of complexes, HR-modules, representability, truncations and connective covers. |
| /22 | StableHomotopyKTheory (#999) | Import the pinned nerve/realization/`LocalCoefficientSystem` and AlgebraicTopology Stages 2, 5 and 8. Only a fully twisted Serre coefficient version, if needed, remains. |
| /23 | SchemeKTheoryOperations (#987), StableHomotopyKTheory (#999) | H.6 → S.4. S.4 keeps its filtrations and checks convergence hypotheses. |
| /25 | KTheoryLowDegrees--U.1 (#764) | CFT Layer 12 and Chebotarev Layer 10 imports, and CA.1 higher reciprocity, for BMS's Dirichlet theorem. The scope is number fields. |
| /33 | BorelRegulators (#74), with H.6 at #999 | Cartan–Serre/Milnor–Moore owned in H.6 with its hypotheses; AlgebraicTopology Stage 5 for the Serre spectral sequence. |
| /34 | BorelRegulators (#74) | S.6 → R.4. The topological Adams operations and the change-of-topology compatibility must be added to RT.4:topological. |
| /35 | BorelRegulators (#74) | Split ALS.5's early characteristic-zero quotient comparison off its automorphic part, and import it in R.2. |
| /36 | BorelRegulators (#74) | Burgos's all-weight comparison r_Bo = 2 r_Be and the factor 2^d. Bloch–Wigner is only a weight-two test. |
| /37 | KTheoryFiniteLocalFields (#763) | InductionRestriction Layer 6 import and the Green lift in L.1. Topological Adams operations and Atiyah–Segal go in the shared topological owner. The simple-space Whitehead theorem is /5's. |
| /39 | KTheoryFiniteLocalFields (#763) | CR.5:log-algebra → L.5. The universal log de Rham–Witt complex goes beside CR.4/CR.5, with the Hyodo–Kato comparison in CR.6. The odd-p ℤ_(p) scope is preserved. |

**/38 was rejected by the verifier.** The existing CFT5 → T.7 → L.3 and CFT5 → D7 → M.7 → L.6 routes are
kept, and nothing was changed.

## Stage order

I checked the implied stage graph for cycles, before and after this job. It consists of:
- the assembled atlas stage edges;
- one edge per node prerequisite across every promoted packet, with the seven revised packets
  substituted;
- the integrated decompositions.

**Before, five cycles:**
- K.2:plus/K.3/K.4/K.4:construction/H.5:S-delooping;
- an 11-stage cycle through K.6/K.7, T.2/T.3 and S.2–S.6;
- N.7/N.8/V.5;
- N.5/R.7/V.2–V.4/M.8/P.2;
- R04.1/R04.2.

**Fixed by this job:**
- The K.2:plus/K.3/K.4 cycle (/4, /20, /21).
- The K/T/S cycle:
  - S.5 → K.6 and S.6 → K.7 (/17);
  - T.3:localization-comparison ↔ T.2:symbols (the T.1 correction above);
  - the T.3:localization-comparison ↔ T.4 order (/28).
- During integration, a cycle one worker had introduced. Three K.6 nodes cited
  `K.2:low-degree-comparisons/explicit-low-degree-models`, which lies after U.6, and U.6 lies after K.6
  through S.2 → S.3 → U.5 → U.6. They now cite K.2:plus/plus-equals-Q, U.2 and U.3 and the H.3 plus
  construction (by request). The relative degree-one clause went to U.6, as described above.

**Remaining:**
- The three cycles outside these findings: N.7/N.8/V.5, N.5/R.7/V.2–V.4/M.8/P.2 and R04.1/R04.2.
- One new one, K.6 ↔ K.7, deliberately kept. Weibel's Bass delooping (IV.10) and the splitting of the
  fundamental theorem (V.8.2) use the external product with [t], which is K.7's pairing. The node graph
  is acyclic, since the pairing depends on nothing in K.6, but the atlas orders K.6 → K.7.
  - The K.6 packet's `restructure` list proposes an early K.7:products stage before K.6. This is for the
    maintainer.

## For the maintainer

**Atlas stage edges to add.** Every packet also records these in its `restructure` or `requests` entries.
- **ArithmeticKTheory:**
  - N.4 → B.1, N.3:ranks → B.1 and N.8 → B.3;
  - T.5 → N.2, T.3:localization-comparison → N.2, T.5 → N.6 and T.5 → N.8;
  - U.4 → N.3:ranks, U.6 → N.8 and Z.6 → N.8;
  - M.3 → N.6;
  - H.1 → N.3:finite-generation and H.6 → N.3:finite-generation.
- **GeneralAlgebraicKTheory:**
  - H.2 → K.4:construction;
  - K.4:construction → K.5, K.4 → K.5 and K.2:plus → K.5;
  - Z.1 → K.5, U.1 → K.5 and U.2 → K.5;
  - K.2:plus → K.6 and K.2:plus → K.7;
  - U.2 → K.6 and U.3 → K.6.
- **K2SymbolsBrauer:**
  - T.4 → T.3:localization-comparison;
  - T.3:localization-comparison → T.5 and U.4 → T.5;
  - T.4 → M.4;
  - EllipticCurves Layer 2 → T.4;
  - CFT Layer 14, QuadraticFormInvariants 6E, QuadraticFormInvariants 7B and CA.1 → T.7;
  - T.1:classical → H.3 and T.1:classical → V.1.

**Atlas stage changes.**
- Drop K.4 → K.3.
- Create K.3:cofinality after K.4 and K.4:construction.
- Drop EnhancedDerivedSheaves E5:abstract → K.4:construction and H.5:spectra → K.4:construction; no
  K.4:construction node uses them.
- Withdraw the T.3 packet's earlier proposal T.3:localization-comparison → T.4.
- Consider an early K.7:products stage (see Stage order).

**Base-text changes.** Each is the stage-text counterpart of a packet change above.
- N.3:finite-generation drops "Develop the arithmetic-group finiteness and finite-type homotopy input".
- R.1's "finite-type homotopy consequences" becomes integral Steinberg-homology finiteness with the
  twisted dualizing module.
- R.3 drops "and S-integer cases".
- B.1 drops "Prove finiteness and positivity of w₂".
- B.3 imports N.8's certificate.
- K.4:construction owns additivity, the relative S-fibration and the Q-comparison; late K.4 drops "and the
  delooping theorem".
- H.5:S-delooping's pairing clause moves to K.7.
- T.5 drops its certified-presentation and "nontrivial example in N" sentences.
- T.7 imports M.3's map and theorems, keeping a compatibility clause, and derives reciprocity from CFT 10,
  CFT 14 and CA.1.
- T.3:localization-comparison's residue and finite-support sentences move to T.3:symbols.
- K.6, S.2, S.5 and S.6 each say that the scheme forms import the ring theorems.

**Other files.**
- PAPER-CLAUSEN-MATHEW-MORROW-21/076 can cite `K.6/milnor-square-excision-in-nonpositive-degrees` (degrees
  ≤ 0, which is all Prop. 4.34's proof uses) and `K.5/milnor-square-mayer-vietoris`. The degree-one
  spectrum form is U.6's.
- SpecialValuesBirchTate's B.3/sqrt-five-birch-tate-check should cite
  `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`. EllipticKTheory
  E.3/naturality-for-finite-transfer may want `T.3/quillen-transfer-norm-residue`.
- `data/blueprints/K3BlochGroups.json` still lists the three moved V.1 nodes, and the errata register
  quotes the old K3BlochGroups/E2 wording. Both regenerate at promotion.
- Open ownership questions:
  - the local m-th power Hilbert symbol, CA.1 or T.7 (CA.1 cannot import T.7 once T.7 imports CA.1);
  - the real sign symbol, T.5 or T.7;
  - the discrete-group Hochschild–Serre low-degree sequence behind Hopf's formula, which no stage owns;
  - ring-level homotopy invariance for regular rings in positive degrees (V.6.3), which no stage plans.
- Outside these findings and not changed: `N.7/w-invariant` re-constructs `N.4/the-w-invariant`, and the
  N.7 part of `ArithmeticKTheory--N.7.lean` keeps `True` placeholders.

## Sources read for this fix

- Kahn, arXiv:1108.2441v3 §4.
- Putman–Studenmund, arXiv:1909.01217v4 §§1–2, 4.1.
- Sun, arXiv:1604.04700v1 pp. 4–7.
- Bühler, arXiv:0811.1480v2.
- Löh's group cohomology notes, Theorem 3.2.18.
- Weibel's K-book: chapters II–V and VI at the locators cited in the nodes. The author chapter files were
  re-fetched, and their hashes are recorded in the packets.
- A Wayback copy of Weibel's errata list.

Each packet records URLs, hashes and read extents in `sources` and `sourceVersions`. Quillen 1973,
Browkin–Schinzel, Waldhausen 1978 and Totaro 1992 were not read: nodes that rely on them say so and name
their locators as the red team or verifier gave them.

## Checks

- `python3 scripts/check_blueprint.py <packet> --index <pinned declarations.tsv>`: 0 errors and 0 warnings
  on all seven packets. Node counts:

  | Packet | Before | After |
  |---|---|---|
  | N.1 | 44 | 52 |
  | N.7 | 15 | 14 |
  | K.1 | 33 | 37 |
  | K.6 | 22 | 32 |
  | T.1 | 45 | 62 |
  | T.3 | 58 | 62 |
  | K3BlochGroups | 102 | 99 |

- `research/blueprint/intake.py check-files` on the 22 deliverables: no problems.
- Each JSON file keeps its own formatting.
- No live reference remains to a deleted node. The ids survive only in review `checked` lists and
  provenance notes.
- `scripts/build.py` `assemble()` succeeds with the revised packets substituted for the promoted copies.
- Lean: the T.1 and K3BlochGroups suggested files were compiled at the Mathlib pin, as reported above. The
  other five were not compiled; their changes are comments and commented signatures.
