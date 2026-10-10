# REV-FIX-RT-AREA-iwasawa-2~2 — independent scoped review

Codex, session `codex-hfOgRV`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219),
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6092502663).
Input atlas commit `6f33e182fbf86247180598b3ce8cc0fda8e2b0cd`.
This session did none of the author fix. It took one job.

**The issue-named review work is finished. L3 remains accepted within the fix
scope; PMIA needs changes to reuse current Tau Ceti's Fitting ideals. This is
an administrative checkpoint because the queue requires two additional
packet reviews that the live issue does not authorize.** No new full audit of
either large packet is claimed. Earlier independent evidence is inherited
with its attribution, including the 50-node L6 ledger below; previous
packet verdicts remain in `reviewHistory`.

## Finding dispositions

Read all six original findings, their verifier verdicts, the round-two fix
report, previous review/handoff, both authorized packet interfaces and the
reviewed L3/L4/L6 library audit. Fresh checks support these dispositions:

| Finding | Scoped verdict and reason |
|---|---|
| /1: Gamma and Gross–Koblitz | L3's Morita foundation is correct: signed natural values, continuous native unit-valued extension, uniqueness and unit/nonunit recurrences. Its modulus-four exclusion is essential. Robert's telescoping identity still requires coefficient decay; the precise RD.6 supplier obligation remains. Full Gauss normalization/root and dyadic theorem obligations belong to L3-2, whose review is outside the live scope. |
| /2: Ferrero–Greenberg | The handoff to L3-2 is correct. Preserve the general correction term, exceptional specialization, conductor and prime hypotheses, derivative coordinates and separate arithmetic nonvanishing input. This session gives no fresh verdict on that excluded packet or its Ferrero–Greenberg/Zhao source reading. |
| /3: integral/open log-syntomic theory | The verified supplier requirement remains stronger than a rational proper semistable comparison. Modified twists, divided/undivided maps and small-weight ranges must be retained. D.1 has a newer independent regulator review; its identity and verdict are preserved. This session does not accept that excluded input or claim that the general producer is closed. |
| /4: Dasgupta–Kakde algebra | The source-specific corrections are sound: evaluation image with congruences, square presentations, contragredient coefficient rings, right-sided higher-adjugate preimage and presentation-dependent transpose. PMIA nevertheless **needs changes** because current Tau Ceti already supplies its generic Fitting carrier, presentation independence and arbitrary base change. |
| /5: derived finite slope | The recorded outside-owner handoff remains the right requirement: cohomological support, solid derived localization and early shared Stein geometry cannot be replaced by a raw determinant product. This run does not re-audit the excluded LAD producer. |
| /6: endpoint duplication | Retain the verifier's rejection and accepted RS-16 decision. The Hecke/congruence and Euler-system routes remain separate; no endpoint is deleted. |

This is a fix review, not an acceptance of all remaining source or supplier
gaps of either roadmap. The packet coverage, gaps, requests and implementation
statuses are preserved.

## Fresh source checks

Fetched these public files on 10 October 2026 into disposable scratch space.
Read Morita and Robert at complete page images; read the indicated DK v3 text
pages. No restricted book, source passage, `excerpt` or new erratum is added.
The DK published version was not freshly read.

| Source | Locators checked | SHA-256 |
|---|---|---|
| [Morita, A p-adic analogue of the Gamma function (1975)](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, Lemma 1, Theorem 1 and following recurrence, printed pp.255–256 | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert, The Gross-Koblitz formula revisited (2001)](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | §4, Theorem 3 and subsequent decay lemma, printed pp.165–168 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Dasgupta–Kakde, On the Brumer-Stark Conjecture, arXiv v3](https://arxiv.org/pdf/2010.00657v3) | §§2.2–2.3 pp.15–18; Lemma 3.9 pp.25–26; §6.1 p.40; Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

For the Morita tests, the empty product is 1, the first signed value is −1,
and deleting multiples of 3 gives G_3(4)=2. The dyadic values G_2(1)=−1
and G_2(5)=−3 differ modulo 4 despite congruent arguments. The recurrence
multiplier is −x on units and −1 on nonunits. These tests distinguish the
signed extension from the unsigned product or ordinary factorial.

For DK Lemma 3.9 the corrected compound-image node explicitly constructs the
preimage by embedding the higher adjugate applied to x, then applying the
compound matrix. The corresponding suggested theorem states both the vector
equality and range membership. No stability of a rectangular matrix image
under left multiplication is assumed. Transpose tests correctly compare the
identity presentation of zero with the two-generator/one-target presentation
of zero; their transposes differ by a free summand. Thus transpose is attached
to a presentation rather than assigned uniquely to its cokernel.

## Libraries and the required Fitting migration

Read current upstream StableReduction Layer 1 and QuiverRepresentations
conventions/Layer 6, and their relevant suggested interfaces. Read current
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and roadmap
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; neither tree was modified or built.
The exact current implementation map is:

| Existing Tau Ceti declaration | What PMIA must reuse |
|---|---|
| `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343 | All degrees for a finite module; finite presentation is a special case. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349 | Computation from any surjection from a finite free module. |
| `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Computation from any generating set of the presentation kernel. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304 | Generic redundant-generator and presentation-independence machinery. |
| `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134 | Arbitrary base change; no flatness hypothesis. |
| `IsBaseChange.fittingIdeal_eq_map`, BaseChange.lean:159 | Existing localization/base-change interface. |

The four generic L6 targets `higher-fitting-ideal`,
`relation-minors-add-generator`, `higher-fitting-independence` and
`higher-fitting-base-change` require migration, together with their direct
transpose consumers, both StableReduction requests, the L4 characteristic
comparison and suggested signatures. Retain necessary concrete matrix/order
lemmas and the adapter from column relation matrices to native kernel/minor
computations. Retain deficient-relation, high-degree, nonprincipal two-cyclic
and nonflat-base-change examples in the native vocabulary.

These modules are absent from the recorded f790474 Git object tree. Hence
this reviewer does not cite them as existing at that pin or silently change
the baseline. The reader is also outside the issue's authorized files.
Coordinated baseline/interface/reader reconciliation is the remaining change;
`needs_changes` is the completed review verdict for it. The existing
`upstreamNotes` and supplier notes already specify this boundary correctly.

### Additional current transpose API boundary

This continuation found a further migration requirement in
`L6/presentation-transpose`. At current Tau Ceti a91d3aa,
`TauCeti.AuslanderReitenTranspose.compFstEquiv` (Transpose.lean:315)
already identifies the transpose of an arrow enlarged by a zero relation
summand with its transpose times that summand's dual. Therefore
`PresentationTranspose.equivAddZero` should be a specialization through the
contragredient scalar structure. `prodMapEquiv` (line 272), together with
`subsingleton_of_comp_eq_id` (line 360) applied to an identity arrow, supplies
the generic core of `equivAddId`. Their public representative equations
(lines 297, 305, 338 and 345) cover the associated compatibility controls.
No finite projectivity or minimality is needed for these generic cores.

`quotientEquiv` and its two representative equations (lines 192, 199 and 211)
also supply semilinear quotient transport once a dual-coordinate equivalence
maps the precomposition range to the chosen relation submodule. This removes
the need to rebuild generic quotient transport; the matrix/range equality and
contragredient scalar comparison still need to be established. These results
do not supply the projective base-change or arbitrary-presentation stable
comparison by themselves.

Read the complete statements in current main and compared with the pinned
Git object: `quotientEquiv`, `prodMapEquiv` and `compFstEquiv` are absent at
f790474, while `subsingleton_of_comp_eq_id` is already present there. The
packet now records this additional migration boundary in `upstreamNotes`,
without pretending the newer declarations are part of its baseline. This
extends the required migration beyond the four Fitting nodes. The earlier
50-node ledger remains historical planning evidence at its stated baseline;
it does not override this current-main duplication check.

Robert's decay proof was also freshly checked through printed pp.167–168:
the odd-prime denominator estimate cannot be reused unchanged for p=2. The
binary digit-sum bound controls the dyadic loss and forces the translated
remainder to vanish uniformly. Thus the RD.6 supplier boundary is still a
substantive analytic obligation, not a consequence of finite telescoping
alone. No statement from the source is transcribed into the packet.

Freshly read the pinned character-evaluation, tagged orthogonality and
Auslander–Reiten transpose interfaces. Compared the shared-build source bytes
for all three modules with Git objects at f790474: all match. Character
orthogonality retains finite commutative group, domain and enough-roots
hypotheses; the transpose cokernel needs no minimality. Other baseline audit
receipts remain inherited evidence, not newly attributed to this session.

## Checks and changes

| Fresh check | Result |
|---|---|
| L3 packet checker | 0 errors, 26 inherited short-API warnings outside the fix scope |
| PMIA packet checker | 0 errors, 0 warnings |
| Full PMIA `lean-check` | Exit 0; 1,075 warnings, all `sorry`, no other warnings or errors |
| Full L3 `lean-check` | Exit 1: unknown `research` module prefix, before declaration elaboration |
| L6 definition/test inventory | 50 nodes, 172 API items, 57 tests; every test name appears in the suggested file |
| Source-text inventory | Neither authorized packet contains an `excerpt` key |

Both full Lean checks finished with more than 100 GB available at launch.
L3 imports the PMIA and
L0/L1/L2 research prototypes; their compiled artifacts are not on the shared
build's import path. This is not a successful full L3 signature check. No
language server, dependency build or private project was started. No Lean
process from this session remains running.

Updated the two top-level review receipts and archived their preceding
receipts in `reviewHistory`. Continued the scoped report while retaining
the prior L6 ledger and its attribution. Updated the handoff and added a
current-main transpose API migration note to `upstreamNotes`. No
mathematical node, source finding, supplier request, baseline pin, signature
or excluded review is changed.

## Administrative blocker and next action

The live issue names L3 and PMIA packets/suggested files plus this report.
The queue also requires L3-2 and D.1 packets/suggested files, and
`issues.deliverables_complete` requires this review identifier on all four
packets. It permits a finished `needs_changes` verdict: PMIA's verdict is not
the administrative blocker. The live five-output scope is complete; the
queue nine-output scope is incomplete.

WORKERS.md requires: “Edit only the files the issue names, plus your own
scratch space.” Asked the user to authorize the four additional queue-listed
files; no answer has arrived. No excluded file, queue entry, issue body or
label is edited. A scope decision is required: authorize the additional
reviews, or reconcile the queue to the live issue. Another unchanged
five-output continuation cannot satisfy the queue. This is a checkpoint
solely for that required authorization; the named independent review is done.

## Retained prior L6 audit ledger

Each node has prefix `PadicMeasuresIwasawaAlgebras:L6/`. The following ledger is retained from Codex session codex-KQjyXV's independent audit, not claimed as a new full audit by this continuation. Implementation remains unchecked.

| Node | Current verdict | Source locator / supplied proof boundary |
|---|---|---|
| `character-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `joint-evaluation-injective` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-scaled-idempotent` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `character-group-ring-lattice` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-finite-index` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-nonzerodivisor` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `norm-element-kernel` | correct | Lemma 2.2 and proof, arXiv v3 PDF p. 16 |
| `character-idempotent-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-group-ring-equiv` | correct | §2.2, arXiv v3 PDF p. 15 |
| `group-ring-component-decomposition` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-norm-quotient` | correct | Corollary 2.3, arXiv v3 PDF p. 16 |
| `character-group-ring-unit-criterion` | correct | §2.3, arXiv v3 PDF p. 18 |
| `character-group-ring-unit-one-character` | correct | §5.2, arXiv v3 PDF p. 34 |
| `character-group-ring-local` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-maximal-ideal-power` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-eval-local-hom` | correct | §5.1, arXiv v3 PDF p. 34 |
| `character-group-ring-residue-field` | correct | Proof of Lemma 8.22, arXiv v3 PDF p. 64 |
| `character-group-ring-adic-complete` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-index` | correct | Lemma 2.5, arXiv v3 PDF p. 17 |
| `sharp-involution` | correct | §6.1, arXiv v3 PDF p. 40 |
| `contragredient-dual` | correct | §6.1, equation (80), arXiv v3 PDF p. 40 |
| `quadratic-presentation` | correct | §2.3, arXiv v3 PDF p. 16 |
| `fitting-quadratic` | correct | §2.3, arXiv v3 PDF p. 16 |
| `higher-fitting-ideal` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `relation-minors-add-generator` | correct | Appendix B.2, the paragraph before Lemma B.5, arXiv v3 PDF p. 94 |
| `higher-fitting-independence` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `higher-fitting-base-change` | correct | Appendix B.2, after (172), arXiv v3 PDF p. 93 |
| `locally-quadratic-presentation` | correct | Remark A.7, arXiv v3 PDF p. 86 |
| `extension-relation-matrix` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `quadratic-presentation-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-fibre-product` | correct | Lemma 2.7 and proof, arXiv v3 PDF p. 18 |
| `pid-cokernel-cardinality` | correct | Proof of Lemma 2.4, the case of a PID, arXiv v3 PDF pp. 16–17 |
| `finite-index-cokernel-descent` | correct | Proof of Lemma 2.4, displays (27) and (28), arXiv v3 PDF p. 17 |
| `cokernel-modulo-finite-ideal` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `finite-index-subring-nonzerodivisor` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `quadratic-cardinality` | correct | Lemma 2.4, arXiv v3 PDF p. 16–17 |
| `compound-matrix` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `complement-shuffle-sign` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `generalised-laplace-expansion` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `higher-adjugate` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `compound-image-determinant` | correct | Proof of Lemma 3.9, last step, arXiv v3 PDF p. 26 |
| `exterior-cokernel-annihilator` | correct | Lemma 3.9, arXiv v3 PDF p. 25–26 |
| `presentation-transpose` | correct | §6.1, (81), arXiv v3 PDF p. 40 |
| `transpose-stable-equivalence` | correct | §6.1, arXiv v3 PDF p. 40 |
| `transpose-fitting` | correct | Lemma 6.1, arXiv v3 PDF p. 40 |
| `transpose-higher-fitting-free` | correct | Proof of Kurihara's conjecture after Lemma B.4, arXiv v3 PDF p. 94 |
| `transpose-higher-fitting` | correct | Proof of Lemma B.4, equation (171), arXiv v3 PDF p. 93 |
