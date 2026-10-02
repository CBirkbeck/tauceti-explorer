# Independent verification of RT-PAPER-KISIN-ZHOU-25

Reviewer: Codex, session `codex-rtOQ9t`. Date: 2026-10-02.
Issue: [#4040](https://github.com/CBirkbeck/tauceti-explorer/issues/4040).
Reviewed repository base: `8272d65a57a17793b29cd0dce4d004e4e66f0744`.

## Result

All 90 findings have individual verdicts in
`research/blueprint/redteam/RT-PAPER-KISIN-ZHOU-25.review.json`:
88 confirmed and two rejected, /74 and /81. The confirmed findings comprise
7 high, 56 medium and 25 low severity findings; both rejections are low severity.
A confirmation establishes the defect described in its reason. It does not
endorse every sentence of the red team's proposed repair. The reasons specify
corrected repairs, narrower hypotheses and unresolved supplier obligations.

The two rejections concern the extraction report's explicitly preserved
checkpoint history. Its current opening and first source-issue list agree with
the JSON. Lines 93–95 introduce “Checkpoint history (unchanged)” and expressly
say the current continuation supersedes the earlier classifications. The old
E5 label, old E6–E9 labels and old absence-of-review statement describe that
earlier checkpoint. They are not competing current verdicts. Regenerating the
historical section from current JSON would erase its provenance. This does not
reject the underlying source slips, already recorded separately.

The high-severity repairs address the affine-Weyl owner, the ordinary-locus
statement, the field over which the lifting cocharacter and filtration live,
the omitted CM case, the ramified rank-one uniformizer and two owner-level
cycles. The item graph itself is acyclic: grouping its items into owners creates
the cycles. Breaking those cycles requires separating general suppliers from
Shimura or abelian-variety applications, not deleting genuine prerequisites.

## Independence and method

I checked the complete issue and the claim confirmation before starting. The
claim was [comment 5946122920](https://github.com/CBirkbeck/tauceti-explorer/issues/4040#issuecomment-5946122920).
I checked the extraction, extraction-review and red-team issue/PR provenance:
the extraction's recorded sessions were `codex-c83e7a` and `cc-442dc5`, its
independent review was `cc-d67081`, and the red team was `cc-c2c06b`. None is
this session. I did none of the three excluded jobs.

I read all 90 findings, the complete 63-page extraction source, the extraction's
210 statement/status/prerequisite/locator records, all 12 route records and all
17 prerequisite records. I then read the full item fields, report passages,
source-issue entries, owner stages, accepted restructurings and sibling
extractions relevant to each claim. I checked the current extraction review
and the separate errata review. This was a targeted verification of the
findings, not a new acceptance review of every extraction field or every
secondary reference. The per-finding reasons record the resulting checks.

PDF text was supplemented by rendered-page inspection of pages 23, 24, 26,
27, 32, 35, 37 and 52, particularly for primes, tensor base rings and signs.
Elementary matrix and lattice controls were computed separately. I inspected
the reviewed library-audit metadata and the relevant SF.0 and ShimuraData D4
records; cited library statements were independently read at the actual pinned
commits rather than inferred from audit labels or a current checkout.

## Public sources and their scope

The primary source is Kisin–Zhou,
[arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2), 63 pages, read in full.
Its downloaded SHA-256 is
`62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`,
matching the extraction's provenance. This is a verification against that
version. The [arXiv record](https://arxiv.org/abs/2103.09945v2) identifies v2 as
7 October 2024 and says integral-model material moved to arXiv:2409.03689.
The [Annals publication record](https://annals.math.princeton.edu/2025/202-3/p03)
records a later revision on 19 November 2024 and publication on 2 November
2025, pages 1077–1156. I did not obtain or collate the final journal text.
Source-error verdicts therefore refer to the identified public version; they
are not assertions that every slip survives in the published article.

Selected secondary sources were read at the relevant statements and proofs:

| Public source | Independently read evidence | Boundary |
| --- | --- | --- |
| [Chin, math/0206147](https://arxiv.org/pdf/math/0206147) | §2.1 plainness, §4.3 irreducibility, Theorem 4.6 and its proof | Plainness requires units at every finite place not over p; arithmetic semisimplification and irreducibility are retained. |
| [Conrad, Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf) | §7 setup, Theorem 7.2 and proof, PDF pp. 23–24 | Corrects /47's proposed bibliographic title; Serre tensoring constructs the new F-action and does not assume an F-action on the original abelian variety. |
| [Kisin–Madapusi Pera–Shin, author manuscript](https://people.math.harvard.edu/~kisin/dvifiles/newton2.pdf) | Proposition 1.3.6, Lemma 1.3.8, Theorem 1.3.13, Corollary 1.3.15 and surrounding arguments | Gives a numbering dictionary for KZ's 1.3.7, 1.3.9 and 1.3.16; lift independence is distinct from integral extension of tensors. |
| [Kisin–Pappas–Zhou, 2409.03689v1](https://arxiv.org/pdf/2409.03689v1) | Lemma 7.2.5 and proof, §§7.2.6–8, Proposition 7.2.18 statement and proof opening | This version has no numbered part (5) of 7.2.18: its free-coinvariant paragraph is conditional. A version dictionary is required. |
| [Poonen, math/0204002](https://arxiv.org/pdf/math/0204002) | Theorem 3.3 and proof, Corollary 3.4 and proof, nearby discussion | Theorem 3.3 allows smooth quasi-projective varieties; Corollary 3.4 requires smooth projective geometrically integral input. |
| [Anschütz, 1804.06356](https://arxiv.org/pdf/1804.06356) | Introductory A_inf statement; Lemma 10.2 and Proposition 10.3 with proof | Proposition 10.3 is for the parahoric group over the specified R_E = O_E[[z]] setting, not an arbitrary stabilizer over an arbitrary period ring. |

The five secondary downloads whose hashes were recorded are: Chin
`c0e3b107c6c5e8067bc01208e7bdea8c4196387c91bf74afa21c6c6baa0b3e40`;
Conrad `7eac62b943ebd035de37f40df6054e1300ba4a0f02356cca919635eef994fdbe`;
KMPS `f3f2b164540a1c8524a947b413bd9facdd261441ff4665dc5d4ef0dc699f2f70`;
KPZ v1 `b508c1ea29f8c8aeeb656ee0af95851af08d8e2ef381fef4462133db772dc8fe`;
Poonen `7d221287249075b517e900132599153d6faf2a17aa44005a02cf717baec3af4b`.

I did not acquire the original LMB Theorem 6.3 text. /59 confirms the concrete
extraction and owner-dependency problem, while retaining the original theorem's
exact hypotheses as a supplier gate. Nor did I read every cited He, AGLR,
Kisin, PR or KPZ proof. Findings about their missing extraction contracts are
verified against KZ's explicit use and the extraction's absent records; their
repairs must still acquire and extract the original statements. No confirmation
converts a cited but unread theorem into a proved general supplier.

## Pinned library evidence

Mathlib was read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`, using the committed files even where
the available checkouts had different HEADs.

- /51: `IsSmoothAt.exists_notMem_isStandardSmooth`,
  `IsStandardSmooth.exists_etale_mvPolynomial` and
  `Smooth.exists_isStandardSmooth` supply the standard-smooth neighborhood and
  étale-coordinate ingredients. Their finite-presentation and point/local
  hypotheses remain part of the adapter. Étale base-change stability is also
  present; it must be imported rather than planned again.
- /30: `Module.Grassmannian` already has the projective quotient carrier and
  rank-at-stalk condition. The scheme representing the Grassmannian functor is
  additional work. A rank-d subspace corresponds to a rank-(n−d) quotient;
  the existing carrier must not silently reverse conventions. RS-27 assigns
  the relative Grassmannian supplier to ModularCurves 0G, with R09.1 importing
  it for further geometric properties.
- /61: Tau Ceti's `posRootCone` is the additive monoid generated by the simple
  roots, with coefficient and pointedness results. Integral dominance should
  use that carrier, and coroot dominance its flipped-root-system adapter.
  The missing work is relation packaging, not another cone definition.
- /84: `pairingIn_le_zero_of_ne` is under the characteristic-zero section
  assumptions. “Over a domain” alone loses a real hypothesis.
- /85: `Cocharacter.levi` and `leviFunctor` supply the dynamic centralizer
  carrier. Scheme representability, rational-cocharacter scaling and descent
  require their own adapters; the carrier alone does not prove all of N10.
- /90: `graphPermA`, `cartanMatrix_A_graphPermA`, `diagramSymmetry` and
  `DynkinType.diagramAut` already cover the model diagram symmetry and its
  simply connected root-datum automorphism. Transport to the actual based root
  datum must preserve the lattices and pairing. These declarations do not
  themselves establish every folding result.

## Owner and dependency checks

The current owner descriptions were compared with accepted RS-02, RS-17,
RS-25, RS-27 and RS-31. An old stage description cannot override an accepted
narrowing. In particular SF.0 no longer owns generic local-coordinate geometry,
FA.5 owns finite-cover function-field Chebotarev, and affine finitely presented
Weil restriction has the ModularCurves 0F supplier. A paper-local continuation
label is not necessarily the design ID generated by `make_queue.py`.

Direct edge witnesses, written prerequisite → consumer, include:

| Finding | Witness | Repair boundary |
| --- | --- | --- |
| /6 | N03 → N22/N02, N13 → N24; N24 → N25, N05 → N08 | Separate affine-Weyl/root combinatorics from B(G) and Newton comparison applications. |
| /7 | E02 → E03 → E09; A05 → A10 → A12 | General invariant/group inputs precede Shimura applications and abelian-variety corollaries. |
| /53 | D15 → D17 and N26 → D15 | General J_b construction is distinct from its p-divisible-group quasi-isogeny action. |
| /58 | E03 → E04 and E07 → E11 | Compatible systems do not require a Shimura tower as their definition. |
| /59 | S25 → C10 and C10 → C12 | General rational-point atlas input precedes the Shimura curve application. |
| /60 | S19 → S20 and S20 → S25 | The local-group theorem takes its exact hypotheses; the special datum verifies them later. |

The complete item-level dependency graph has 210 vertices and no cycle. These
witnesses show why that observation does not establish owner-level buildability.
S17, S34, S40, N21 and R06 have no item consumers, despite uses identified in
the source; repairs must restore the relevant explicit edges.

Sibling checks compared the actual statements and routes in He 2018,
van Hoften, Görtz–He–Nie, He 2021/Fargues–Scholze, KP 2018,
Bakker–Klingler–Tsimerman, Böckle–Harris–Khare–Thorne and Anschütz–Le Bras.
They support coalescing common carriers while keeping scope adapters. A tame
Pappas–Zhu local-model theorem is not automatically the full broader KZ theorem;
integral Chevalley restriction is not a consequence of a characteristic-zero
version; Witt-vector and general-frame display interfaces are not interchangeable
without specifying the frame comparison.

## Independent algebraic controls

For /5, the rank-one SL_2 factorization uses x/u over the actual extension
field's uniformizer u. Replacing u by the loop parameter t changes the valuation
step by the ramification index. This is a mathematical parameter error, not
an interchangeable spelling.

For /77, with x in the fixed field, the printed c = −2/x and d = +2/x² give
c² + d + d = 8/x², violating the unitary root-group relation. Taking
 d = −2/x² makes the relation zero. The inverse upper unipotent matrix is
`[[1, −2/x, −2/x²], [0, 1, 2/x], [0, 0, 1]]`; multiplication by the printed
diagonal and lower matrix then gives
`[[0, 0, −2/(u*x²)], [0, 1, −2/x], [u*x²/2, u*x, −u]]`, matching the intended
page-52 factorization. The rendered page confirms the printed positive sign.

For /34, odd-dimensional GU examples with lattice coordinates
(a,b1,b2), b1+b2 = n*a and inertia swapping b1,b2 have a primitive relation
(n,−2), giving free coinvariants for n = 3,5,7. The compact sign sublattice
has Z/2 coinvariants which can be killed by its map into the larger lattice.
Thus freeness of a quotient does not prove the asserted subgroup freeness by
itself. This is a control on that general inference, not a counterexample to
all additional properties of KZ's particular auxiliary group. The correct
repair tracks the actual central-torus exact sequence and the inertia homology
term; it must not replace inertia by full absolute-Galois coinvariants.

For /45, a nontrivial GL_2 unipotent has its unique invariant line generated by
e1. A nonsplit torus generated by `[[0,d],[1,0]]` does not preserve that line,
so an arbitrary such torus need not sit in a Borel whose unipotent radical
contains this element. Choosing an adapted Borel and torus after the required
finite extension repairs the proof step. This does not refute the compactness
conclusion of the lemma.

These are ordinary symbolic checks, not Lean proofs.

## Repair guardrails and validation

The JSON reasons cover every finding, including the low-severity locators,
source slips, stale titles and library leads. Particular guardrails are:
keep D13 over the actual finite extension and D10 existential over its stated
base; do not infer minuscule representation from two cocharacter weights;
retain the standing odd-p hypotheses only where the source uses them; distinguish
pro-tower trivial-inertia input from a general finite-level good-reduction
assertion; retain the extra hypotheses in a free quotient action; and preserve
the H¹/dual-Tate convention consistently. /80 corrects the former review's
argument: a smooth chart can be shrunk to an affine, hence quasi-projective,
chart. The issue in the invoked projective Poonen corollary is projectivity,
not a general failure of quasi-projectivity.

The unproved integral Levi-tensor adapter remains a closure gate. General
presentation geometry requires a common supplier recorded for design rather
than being appended blindly to narrowed SF.0. The auxiliary coinvariant proof
needs the specific induced-module and central-kernel inputs. Each new source
issue must receive an actually unused ID; /69's already recorded A_E slip
should be linked to the errata record rather than duplicated. Final-journal
collation and original-source supplier extraction remain explicit limitations.

Validation: `scripts/check_redteam.py` passes; the review has exactly the 90
source finding IDs with no omissions or duplicates; verdict/severity counts
are independently recomputed. `research/blueprint/intake.py check-files` and
`git diff --check` pass. The submission changes only the two issue deliverables.
No Lean file is a deliverable, no Lean compilation was run, and nothing is
claimed formalised.
