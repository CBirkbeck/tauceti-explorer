# Independent review of ModularityAndLanglandsExtensions

Issue #541; reviewer: Codex, session codex-vnVGXw; 7 October 2026.
Verdict: **needs_changes**. This independent review is finished; it is not a
checkpoint. The reviewed blueprint was written by Claude sessions cc-39fac3 and
claude-okz2gt. No roadmap has been promoted and no upstream roadmap has been edited.

I checked every one of the 138 nodes against its cited statement, hypotheses,
proof dependencies, API, tests and suggested signature. The authoritative
per-node ledger is `review.checked` in
[the packet](../packets/ModularityAndLanglandsExtensions.json). A `corrected`
entry records a clear correction applied in this review; its note can still
identify an unresolved signature or proof dependency. An `unverifiable` entry
means that the proposed declaration and its justification cannot be certified
as supplied. It does not dispute the corresponding published theorem.

| Stage | Nodes | Verified | Corrected | Unverifiable | Coverage | Planets |
| --- | ---: | ---: | ---: | ---: | --- | ---: |
| ML.0 | 13 | 1 | 8 | 4 | partial | 0 |
| ML.1 | 8 | 0 | 4 | 4 | partial | 3 |
| ML.2 | 32 | 0 | 7 | 25 | partial | 6 |
| ML.3 | 48 | 0 | 14 | 34 | partial | 6 |
| ML.4 | 27 | 0 | 13 | 14 | partial | 6 |
| ML.5 | 10 | 0 | 6 | 4 | partial | 4 |
| Total | 138 | 1 | 52 | 85 | partial | 25 |

There are no added nodes. The revised packet contains 40 sources, 134 API
entries, 96 test specifications, 40 supplier requests, 13 gaps and 16 reviewed
source issues. Its 25 definitions/constructions each retain at least three
tests. The checker counts 128 API entries and 92 tests because it does not
include the extra API/tests on comparison nodes. One mathematical negative
control was added; two planets were removed. All implementation statuses remain
`unchecked`.

The packet previously marked every stage planned and itself complete. Those
claims cannot stand while definitions admit incoherent objects, theorem
signatures omit hypotheses, and supplier requests are presented as established
exports outside the supplier's scope. Each stage now has a precise `remaining`
list. The packet is `partial`: the checker forbids `complete` below 300 nodes
while any stage is unplanned. That artifact status describes the blueprint,
not an unfinished review. The rejection concerns incorrect proposed mathematics
and unresolved contradictions, rather than the mere existence of recorded gaps.

The principal reasons for the verdict are as follows.

1. **Supplier records do not define the mathematical objects they claim to
   represent.** `Context`, `GaloisData`, `CompatibleSystemData`, `ArtinData`,
   `G5Context` and `CategoricalContext` contain independently assignable fields
   without the laws used by their API. A predicate named purity does not
   constrain an independently assigned characteristic polynomial, residue
   cardinality or Hodge data. Consequently the proposed convergence theorem
   does not follow for these records. An arbitrary function labelled an Artin
   L-function does not acquire continuation from a representation in a separate
   field. Similarly, arbitrary direct-sum, duality, local-parameter and category
   fields do not satisfy the advertised compatibility statements. The signature
   pass must connect actual supplier objects and operations or state their
   precise coherence laws. Tests must use those objects, rather than independent
   hypotheses asserting the value being tested.

2. **Conditional classifications hide hypotheses in arbitrary propositions.**
   `ArthurInputs`, `TraceFormulaInputs`, `kmswHypotheses` and `CaseI` are not
   exact mathematical assumptions. A named external theorem can be conditional
   on its explicit hypotheses; replacing its input by an unexplained proposition
   does not state that theorem. This violates PROTOCOL section 13. The incorrect
   `G5PRSwitchData.Holds` and `prSwitch` declaration have been removed entirely.
   Other affected signatures remain visibly flagged sketches awaiting revision;
   successful elaboration does not certify them.

3. **Several central signatures differ substantially from their sources.**
   [BCGNT Proposition 6.2.3](https://arxiv.org/pdf/2309.15880) concludes weak
   automorphy of the untensored symmetric power under seventeen conditions. It
   is not an equivalence between residual automorphy at two characteristics of a
   single tensor product. The packet now gives the auxiliary systems, residual
   isomorphisms, image conditions, local connects conditions and lifting/descent
   route explicitly. Its replacement Lean signature needs genuine typed data.
   [Newton–Thorne II Theorem 2.1](https://arxiv.org/pdf/2009.07180v2) requires
   a projective-image sandwich between PSL₂ and PGL₂ over a finite field of
   cardinality greater than max(5, 2n−1). This is restored in the packet and
   flagged as missing in Lean. [Mok Theorem 2.5.2](https://arxiv.org/pdf/1206.0882)
   retains packet multiplicities and gives multiplicity one only for generic
   parameters; the suggested set representation loses repetitions.
   [Fargues–Scholze Conjecture I.10.2](https://arxiv.org/pdf/2102.13459v4)
   specifies the canonical right adjoint, compact objects and an equivalence
   with bounded coherent objects of quasicompact support and nilpotent singular
   support. An arbitrary fully faithful ordinary functor is insufficient.

4. **Proof closure still imports more than the checked suppliers supply.**
   Patrikis–Taylor's pure regular compatible-system theorem cannot follow from
   BLGGT's extremely regular theorem. NT's residually reducible lifting is not
   supplied by an irreducible-residual potentially diagonalizable theorem.
   BCGNT Theorem 6.2.1 uses its purity lemma and Varma's local–global comparison;
   a second invocation of automorphy lifting does not replace them. AL.4
   supplies unramified L-group factors, not Langlands–Shahidi continuation;
   ALS.3 supplies Hecke chain correspondences, not Harder's comparison;
   MP.3 does not supply full Howe duality; ET.3 does not supply every weighted
   and twisted fundamental lemma. The requests now identify missing extensions
   instead of asserting that these stages already contain the results.

5. **Normalization errors affect operative formulas.** For monic
   Qᵥ(X)=det(X−Frobᵥ), the Euler factor is qᵥ^(ns)/Qᵥ(qᵥ^s). Evaluation of
   Qᵥ at qᵥ^(−s) gives the wrong function. The reciprocal polynomial is
   Pᵥ(T)=TⁿQᵥ(T⁻¹), with constant term one. Both proposed product expressions
   and the trivial-system control now follow this convention. The real gamma
   formula also has a missed rank-parity error in the pinned BLGGT text; E16
   records the symmetric-square counterexample and an upstream note for R24.5.
   Merely changing arithmetic/geometric Frobenius terminology does not imply
   duality of Galois representations; the optional atlas realization dictionary
   needs its own exact supplier. The elliptic NT test now uses cohomological H¹,
   dual to the usual Tate module, in the stated Hodge–Tate convention.

6. **The coarse stage order is not certified.** ML.0's GSp₄ packet needs
   ML.4/Gan–Takeda, while ML.4 consumes ML.0. ML.2's elliptic seed needs ML.3's
   ACC elliptic endpoint, while ML.3 consumes ML.2. ML.3's Steinberg construction
   needs Mok/KMSW in ML.4. PA.4's ordinary lifting node lists the coarse ML.1
   stage as a prerequisite, while ML.1 imports PA.4. These may permit a finer declaration order,
   but they contradict the existing coarse acyclicity claims. The restructuring
   proposals now request splitting/reordering and do not claim a proved DAG.

The source and baseline checks support these findings as follows.

All 38 originally listed public PDFs were downloaded and their SHA-256 hashes
matched the packet. BLGGT v1 was also checked against the version-register hash.
All 202 final node citation excerpts match the downloaded text after Unicode
and whitespace normalization. The eight original excerpt mismatches were
replaced with literal text and edition-specific PDF locators. Surrounding
statements were read independently; excerpt matching alone was not treated as
proof of hypotheses or closure. Important complete statements checked include
ACC+ Theorems 6.1.1–6.1.2 and Corollaries 7.1.13/7.2.4, BCGNT Proposition
6.2.3 and Theorems 6.2.1/6.2.4, NT II Theorem 2.1, Arthur Theorems 1.5.1–1.5.3,
Mok Theorems 2.5.1–2.5.2, KMSW Theorem 1.6.1, Gan–Ichino's generic multiplicity
formula, and FS I.10.2. Public editions remain pinned as listed in `sources`
and `sourceVersions`; no claim is made to have collated unavailable journal
versions or read every cited proof in full. Secondary-only inputs and the NT
proof decompositions remain explicit gaps.

The claim that Dummigan–Martin–Watkins was unavailable is obsolete. I added
its public [2009 journal PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf),
checked the introduction and sections 2–3 for finite Euler factors and
conductors, and separately checked [Martin–Watkins section 4.2](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf)
for gamma factors. The former directs the infinity calculation to another
source; it should not be credited with an unread infinity formula. Their
hashes and read sections are recorded in the packet. The conductor and
Weil–Deligne implementation still needs exact supplier exports.

The baseline pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Both original baseline entries
were read at the exact Mathlib commit, not inferred from their names.

| Citation | Pinned declaration and scope | Review action |
| --- | --- | --- |
| [Matrix.trace](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Trace.lean) | Trace of a finite square matrix over an additive commutative monoid; the sum of its diagonal entries | Retained with corrected `provides` and exact hypotheses. Direct prerequisites now connect it to the complex-conjugation and character uses. It provides no adequacy theorem. |
| [groupCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean) | For a representation of an abstract group over a commutative ring, the module-valued homology of the inhomogeneous cochain complex | Removed as unused after retirement of the adequacy nodes. It is not a continuous profinite-cohomology or adequacy export. |

The reviewed `data/library-coverage.json` does not establish weight-one
Deligne–Serre, Langlands–Tunnell or strong Serre as library declarations;
these are roadmap suppliers, and remain imports. The suggested file uses
Mathlib's existing elliptic-curve types. No audited library construction was
replanned as new. I read ClassicalGroups and CompactGroups as the two nearby
upstream models. For cross-roadmap closure I read the exact statements of all
46 distinct fine supplier references and the descriptions of the available
coarse stages, rather than relying on their titles. The newly added universal
deformation-ring and ordinary lifting references were read in full as well. PL.0/PL.5 are checked in their
own packet. Existing supplier files remain unchanged.

The three required red-team routes have these outcomes.

| Finding | Packet and read-only reader check | Outcome |
| --- | --- | --- |
| RT-AREA-langlands-1/7 | PA.1/PA.2 analytic and local–global inputs and PA.4 CM lifting are explicit imports. Qian and Dwork now also name the existing ordinary lifting export. The reader's prerequisite list names the right CM theorem families, but its final restructuring prose still says no layer supplies them and no ML node is a PA prerequisite. | Partly addressed; exact specialized lifting inputs and the stage-cycle resolution remain. The reader needs synchronization. |
| RT-AREA-langlands-2/8 | Both artifacts distinguish Deligne–Serre/R19.1, soluble Langlands–Tunnell/R17.5 and nonsoluble Serre/Khare descent/R27.6. Neither derives weight one from a weight-two Jacobian. The total-real weight-one extension and missing primary inputs are explicitly outside these ℚ-only exports. | Ownership and scope correction verified; the proposed API and totally real proof closure still need revision. |
| RT-AREA-langlands-3/1 | Both artifacts choose an external conditional ML.4 registry and propose a constructive endoscopic Part II. The symplectic branch has its own status, rather than being certified by a unitary result. The suggested arbitrary proposition fields do not specify the registry's exact mathematical hypotheses. | The option chosen is legitimate, but its current signatures do not implement it faithfully. Replace the hypotheses or obtain the constructive owner's exact exports. |

The reader is not an allowed deliverable of #541. It was read, including these
routes, but not edited. Besides the red-team restructuring prose, it still
contains the old Euler convention, source-unavailability statement and several
theorem overclaims corrected in the packet. Synchronization is required in the
revision job; accepting one artifact while leaving the other contradictory
would be unsound.

Every original source issue was checked at its locator and given an independent
decision. There are 13 confirmed entries and 3 rejected allegations after
adding E15 and E16. Rejected allegations are retained with their review verdict,
not used as operative corrections.

| Issue | Verdict | Independently checked reason |
| --- | --- | --- |
| E1 | confirmed | BLGGT has the μ/χ variable slip; this is canonical AG2/E1. The operative CM sign also uses inherited AG2/E2's pure weight. |
| E2 | confirmed | BLGGT's field, index and potential-diagonalizability lemma references require the listed corrections. |
| E3 | confirmed | BLGGT refers to an automorphic π before producing it. |
| E4 | confirmed | The notes reverse CM/non-CM; endomorphisms must be geometric. |
| E5 | confirmed | Symmetric degree changes the convergence abscissa; open-half-plane convergence does not prove boundary nonvanishing, and degree zero has a zeta pole. The historical attribution needs qualification. |
| E6 | confirmed | The bounded multiplicity condition is per norm, not the printed finite initial segment. |
| E7 | rejected | BCGP's archimedean use of the reciprocity notation is an implicit extension of notation, not an established mathematical gap. The blueprint must specify its convention. |
| E8 | confirmed | Undefined μπ should be the central character ωπ. |
| E9 | confirmed | The word “four” before “4-dimensional” is extra. |
| E10 | rejected | The proposed descent correction itself omits a normalization/twist. Source shorthand does not establish an error; the exact blueprint descent/pairing inputs remain a gap. |
| E11 | confirmed | The residual-image subgroup is over K, not the printed G. |
| E12 | confirmed | Pilloni's sentence contains a stray “is”. |
| E13 | rejected | KW explicitly gives a sketch and cites Khare for descent. The omitted argument is a dependency to import, not an established paper error. |
| E14 | confirmed | KMSW explicitly identifies the missing justification in Mok and repairs it in Appendix A; this is a known repaired input. |
| E15, added | confirmed | A constant-one symmetric Euler polynomial has reciprocal Frobenius roots. For degree one it is 1−aₚT+pT². |
| E16, added | confirmed | BLGGT's odd-rank determinant gamma formula omits (−1)^((n−1)/2). Sym²H¹(E) has infinity factor Γℝ(s)Γℂ(s), contradicting the printed Γℝ(s−1)Γℂ(s). |

E16 is restricted to the pinned arXiv edition. The additional parity follows
because each non-middle Hodge pair contributes −1 to the complex-conjugation
determinant. Martin–Watkins supplies an independent symmetric-square positive
control. Public author/arXiv errata searches found no correction for this
formula; the Annals edition was not collated. R24.5's existing Hodge-sign
correction does not cover this rank factor, so `upstreamNotes` identifies the
supplier correction without changing its file.

The API/test pass kept the existing reusable outlines and corrected the
mathematical controls: odd pure weight for polarization, Q=X−1 for the trivial
system, cyclotomic determinant rather than unjustified SL₂ for modular-curve
twists, the torus versus normalizer CM Sato–Tate cases, positive symmetric
degree for nonvanishing, and generic-only multiplicity one. The added
orthogonal-rank-three component-group test detects omission of the
special-orthogonal determinant-one constraint. Counting three tests alone
does not repair the unrelated supplier fields described above. Endpoint
bookkeeping and an imported base-change comparison no longer have planets;
the retained planets meet the six-per-stage limit and describe mathematical
objects or named theorems.

The following ledger records every locally corrected node. Additional changes
to supplier requests, coverage, gaps, baseline entries, source issues and the
suggested-file review warning are described above. All 138 detailed judgments,
including unchanged unverifiable nodes, remain in the packet.

| Node | Applied corrections |
| --- | --- |
| ML.0/blggt-normalization-register | Correct the CM polarization sign using the exact reviewed AG2.0 export. Add an odd-weight negative control for the incorrect sign. |
| ML.2/compatible-system-l-function-continuation | Correct the Brauer argument: automorphic factors are meromorphic, with the rank-one trivial pole retained. |
| ML.3/steinberg-level-raising | Name Mok directly for the unitary Steinberg level-raising construction. Name KMSW directly for the inner-form level-raising construction. |
| ML.3/one-level-one-symmetric-power | Do not treat an irreducible-residual potentially diagonalizable ALT as the residually reducible NT I Theorem 7.6 lifting theorem; exact owner remains a gap. |
| ML.3/symmetric-power-automorphy-lifting | Restore the omitted projective-image hypothesis and the actual field and rank range. Remove the contradictory imported GL2/ℚ-only hypotheses. |
| ML.3/l-function-equidistribution-criterion | Add the actual character-density theorem used by the criterion. Add compact characters and Haar measure directly. |
| ML.3/sato-tate-elliptic-curves | Name elliptic modularity as the input to the Sato–Tate argument. |
| ML.0/endpoint-status-register | Remove the bookkeeping planet (PROTOCOL §14). Reconcile empty-hypothesis test with the actual status data structure; distinguish tag from logical assertion. |
| ML.0/compatible-system-archimedean-factors | Import the compatible-system L-function definition from its R24.5 owner rather than planning it twice. Correct monic versus reciprocal Euler polynomial, strict compatibility, and ownership. Separate the hypotheses for partial and completed L-functions. Add the fine owner of L-functions and their archimedean factors. |
| ML.0/compatible-system-automorphic-l-function-comparison | Distinguish unramified, archimedean and full ramified comparisons. Restore the missing archimedean and completed-comparison conditions. Correct the proof boundary for completed L-functions. |
| ML.0/nt26-automorphy-predicate | Correct the elliptic test to the cohomological realization dual to the Tate module in NT/BLGGT conventions. |
| ML.0/nt26-normalisation-bridge | Remove the unsupported implication from Frobenius terminology to representation duality. Make the duality claim depend on a realization dictionary. |
| ML.0/gsp4-galois-l-packet | The GSp4 Galois packet uses Gan–Takeda directly, not only GL2 LLC. Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.0/weight-22-abelian-variety-conjecture | Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.1/strong-artin-conjecture | Use full local matching in the strong Artin predicate. Correct the logical role of strong multiplicity one. Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.1/non-solvable-residual-modularity | Request the R22.5 lifting direction, not the R22.1 deformation-to-Hecke map, while retaining the exact Hilbert-field supplier gap. |
| ML.1/buzzard-taylor-hypotheses | Replace deformation-functor scope by the actual Schur/Φ_p universal deformation-ring export. |
| ML.1/weight-one-separation-register | The scope register directly uses the irregular-system endpoint. The scope register directly uses the mod-5 endpoint. |
| ML.2/qian-ordinary-potential-automorphy | Name the existing general-rank ordinary CM lifting export for Qian. |
| ML.2/elliptic-symmetric-power-seed | Name ACC+ Corollary 7.2.4 as the elliptic symmetric-power seed. |
| ML.2/dwork-fibre-automorphy-transport | Name the ordinary CM lifting export for the Dwork transport. |
| ML.2/cg18-odd-symmetric-powers | Apply the inherited E230 bound consistently in statement and hypotheses. |
| ML.2/twisted-modular-curve | Remove unnecessary residual irreducibility contradicted by the trivial-twist test. Correct the cyclotomic determinant and moduli descent construction. |
| ML.2/p-r-switch | Replace the incorrect p–r switch conclusion with the source conclusion. Restore all seventeen source conditions, including the two distinct auxiliary systems. Restore the two lifting steps and the untensoring/descent argument. Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.3/bcgnt-potential-automorphy-det-cyclotomic | Correct the purity/local–global upgrade argument. Use the actual purity lemma in the potential-automorphy theorem. The full-local upgrade uses Varma, not just a second lifting theorem. |
| ML.3/one-prime-criterion | Restore the Galois-conjugate automorphic realization. |
| ML.3/completed-symmetric-power-l-function | Replace the unavailable-source claim with public DMW and Martin–Watkins checks; retain exact conductor implementation as a gap. |
| ML.3/acc-elliptic-symmetric-powers | Remove universal ordinarity absent from ACC+ Corollary 7.2.4. |
| ML.3/acc-purity-rank-two | Restore strong irreducibility and positive symmetric degree for the nonvanishing clause. |
| ML.3/sato-tate-group | Do not force the normalizer in every CM case. |
| ML.4/global-arthur-parameter | Restore the special-orthogonal determinant-one constraint. |
| ML.4/local-arthur-packets | Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.4/mok-unitary-classification | Restrict Mok multiplicity one to generic parameters. |
| ML.4/extended-langlands-parameter | Correct multiplicity parity in the component-group calculation. |
| ML.4/amf-nonsplit-so-v | Separate the all-parameter decomposition from the generic-only multiplicity formula. |
| ML.4/packet-member-irreducibility | Restore the canonical good-parity remainder in Gan–Ichino induction. |
| ML.4/gsp4-arthur-classification | Align the BCGP application with its totally real field hypothesis. Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.4/non-general-type-reducible | Use Hilbert Galois forms R19.2 rather than ℚ-only R19.1. |
| ML.4/gl4-symplectic-descent | Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.4/shahidi-exterior-square | Narrow Shahidi to the source-supported value and require Π unitary. Restore the unitary and cuspidal-base-change hypotheses. |
| ML.4/gsp4-gl4-archimedean-transfer | Replace the nonmatching excerpt/edition locator with literal text at the independently read PDF page. |
| ML.4/unitary-descent-of-gl4-transfer | Remove the invalid unnormalized conjugate-self-dual base-change assertion; explicitly retain the missing twist/descent/pairing argument. |
| ML.4/xu-gsp2n-packets | Restrict the cited Gan–Savin specialization to rank 3. |
| ML.3/kim-shahidi-sym3 | Add the direct symmetric-cube Theorem B citation, distinct from the cited GL₂×GL₃ Theorem A. |
| ML.3/kim-sym4 | Add the direct symmetric-fourth Theorem B citation, whose full local scope differs from exterior-square Theorem A. |
| ML.3/ramakrishnan-tensor-product | Restore the exact one-dihedral base-change/self-twist cuspidality criterion. |
| ML.5/cyclic-base-change-gln | Import cyclic base change and soluble descent from ET.7a and PL.0. Separate general automorphic base change from the restricted Galois descent export. Add the exact owner of polarized soluble descent. Remove a planet from the imported comparison node. |
| ML.5/ckpss-generic-transfer | Correct the central-character scope in CKPSS Theorem 7.2. |
| ML.5/automorphic-induction-register | Make the composite cyclic-degree cuspidality criterion quantify every nonidentity conjugate. |
| ML.5/local-langlands-conjecture-general | Add ET.6 as the characteristic-zero GLn known-subcase owner, with its field scope. |
| ML.5/categorical-local-langlands-conjecture | Restore the canonical right adjoint, compacts and exact target of categorical LLC. |
| ML.5/symmetric-power-functoriality-implies-ramanujan | State the unitary-constituent hypothesis needed for the numerical bound. Correct the base-change scaling and bound assumptions. |

The final checks were:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`:
  exit 0, zero errors, zero warnings.
- `lean-check research/blueprint/suggested/ModularityAndLanglandsExtensions.lean`:
  exit 0, no errors, 254 warnings, all for admitted proofs (`sorry`). The build
  uses the exact pinned Mathlib commit. The file imports only Mathlib, so it
  makes no claim to test Tau Ceti declarations against a different checkout;
  Tau Ceti baseline statements were checked at the recorded source pin.
- Structural checks: exactly one review entry for each of the 138 nodes; all
  16 source issues have an independent verdict; each definition/construction
  has at least three tests; every planet count is at most six; all 202 source
  excerpts match; original source hashes match; no whitespace errors and only
  the authorized deliverables plus the handoff are changed.

The orchestrator's next decisions are concrete: authorize the reader sync in
the revision job; split/reorder the PA/ML seed and classification imports;
choose exact conditional classification hypotheses or constructive endoscopic
exports; and route the missing analytic, Harder, theta and conductor inputs to
their owning extensions. The revision should begin with coherent supplier
data and the p–r/NT/Mok/FS/ACC signatures, then discharge the per-stage remaining
lists. It must not label the current sketches accepted merely because they
elaborate.
