# REV-RT-PAPER-SKINNER-20

Codex · session `codex-5ebb6f` · 2026-09-30 · issue #4321 · complete verification.

All six findings are confirmed: one high, four medium and one low. The
verification supplies qualifications for the eventual fixer; it does not edit
the extraction. I did not write the extraction, its original review or the
red-team findings.

## Scope and reproducibility

Reviewed at repository commit `4e25e5f6434da6b90cfa194c3d37e9abed680628`.
Read every finding and the named extraction items, E5/E6, the relevant
prerequisites, all six routes, and the routing paragraph of the paper report.
Independently retrieved the four public PDFs below and read the relevant
passages. This is verification of six findings, not a new certification of all
78 extraction items, all eleven source issues or every cited source proof.

| Public source | Version and independently read scope | SHA256 |
| --- | --- | --- |
| [Skinner, published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) | Annals 191 (2020), 329–354; pp. 329–331, 337–340, 344–346, 350–354. Images checked at 330, 338, 340, 344, 351 and 353. | `cfdfab6e62ac507be40d1f0bc8d9cb8371d95b42c5ae259fde054c70fb20c214` |
| [Skinner, arXiv v1](https://arxiv.org/pdf/1405.7294v1) | 28 May 2014; p. 16's Wan deduction compared with publication p. 346. | `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff` |
| [Burungale–Skinner–Wan](https://arxiv.org/pdf/2603.20886v2) | *A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety*, v2, 10 May 2026; §§1.1–1.4, 2.1.1, Theorem 2.3/Remark 2.4, §3 and §4.1. Images checked at pp. 2, 3 and 10. | `f2b4a020bf5dbcd33df3a4b30cbf27230dc0d0775312f5e543b03b2486f6a994` |
| [Poonen–Stoll](https://math.mit.edu/~poonen/papers/sha.pdf) | Author version of *The Cassels–Tate pairing on polarized abelian varieties*, dated 6 November 1998 with 23 August 2014 correction; abstract and §1, especially p. 2 and its image. | `3b9a619423358bc877fd2123b73a759157a728ec11e0f7b0aa48bd0333d7149a` |

The Skinner PDFs match the extraction's recorded versions. The later repair
is a public preprint; no claim of already completed Lean formalization or
journal publication is made. I did not reread all later-source proofs or
Skinner–Urban's full proof of the Iwasawa input.

Input hashes:

- Red-team result: `4254132a3279d122ba01d50be501836da63bf3bd05fff0bc866f35ac353caf9b`.
- Extraction JSON: `f0856b1afabbd38df0be9014b6289df4d3e3465b8dd0429c3af8ec7218e8121d`.
- Extraction report: `81ff9963470ba395874bba1f785ae602ce99ce6d9fb222824f7d7558de9ded8e`.

## Decisions and applicable corrections

### /1 — Known repair of the logarithm omission

BSW §1.2 explicitly identifies Skinner's Lemma 2.2.2 as an assertion whose
proof was omitted and supplies a proof. Theorem 1.1 treats an abelian variety
over the algebraic closure of Q with a number field F in its rational
endomorphisms, dimension `[F:Q]`, and at least one real embedding of F. For
every non-torsion algebraic point, all nonzero F-eigendifferentials have
nonzero p-adic logarithm, after the specified embeddings. This includes
Skinner's `A_f`, since `M_f` is totally real. The argument uses the analytic
subgroup theorem, its F-stable variant (Theorem 3.2), and the exclusion of
proper F-stable subvarieties in the real-embedding case (§2.1.1 and Remark 2.4).

For Lemma 2.2.2, finite p-primary Sha identifies the rational Selmer space
with Mordell–Weil tensored with Q_p. At rank `[M_f:Q]`, this is a line over
`M_f ⊗ Q_p`. Choose a nonzero algebraic point generating the rational
M_f-line. BSW gives nonzero logarithm in every chosen lambda component at
each completion; L-linearity then gives injectivity on the lambda Selmer
line. The same argument applies over Q and to the quadratic twist used in E.

For Corollary 2.6.2, do not invoke the algebraic-point theorem directly on an
arbitrary element of `A_f(K) ⊗ M_f`. Skinner p. 340 expresses the Heegner
element using the epsilon projector on the rational Hodge-divisor class;
p. 344 compares the projector and the chosen eigendifferential. Clear the
Hodge-class denominators and use the quotient image of this actual algebraic
point. If its projected Heegner element is nonzero, that point is non-torsion;
the differential comparison identifies the required logarithm with its
eigencomponent, up to the explicit nonzero scalar. This is the adapter that
must accompany the import.

Preserve E5/E6 as historical omissions with a known repair, updating their
correction/search/proof-status prose and every affected statement, note and
brief. Restore A/E with the original hypotheses. Keep B(e) as stated. Use
the canonical owner **DiophantineApproximationAndTranscendence:DT.3**, not
an invented shorter roadmap ID, for the missing general transcendence
source request. DT.3's current logarithmic-form contract does not itself
state the required abelian analytic-subgroup theorem. GZ.9 receives the
RM/Heegner application; RankOneConverse imports these. This does not settle
the separate higher-rank independence questions or apply to arbitrary
cohomology classes.

### /2 — Restore mathematical statement fields

Items 5/10/19/59 contain editing instructions in place of full contracts.
Published pp. 330 and 351–352 give A/E with squarefree level, the alternatives
on odd-prime local representations, and the rank/Sha hypotheses and analytic
conclusions. Item 19 must define the torsion module, Selmer group and Sha,
include the Kummer exact sequence
`0 → A_f(K) ⊗ Q_p/Z_p → Sel_{p∞}(A_f/K) → Sha(A_f/K)[p∞] → 0`,
and state the rational and local comparisons. Preserve the finite-S and
away-from-p qualifications of pp. 337–338. Item 59 needs the actual
auxiliary-field construction and deduction from B, including the twist's
nonzero central value and the factorization of the L-function.

Put editorial observations in `note`, keep stable IDs and apply /1
consistently. The derivative-nonvanishing theorem needed for E's choice of
twist remains a separate input; repairing logarithm nonvanishing does not
supply that analytic existence theorem.

### /3 — Indefinite geometry has the wrong supplier

Item 68's R18.3 reference is wrong: p. 340 uses an indefinite quaternion
algebra and a positive-dimensional Shimura curve. Read R17.3, R18.1, R18.3,
R18.4 and GZ.3. R18.3 supplies definite forms on a finite class set; it cannot
construct the required curve. Retain R17.3 for transfer, use R18.1 for the
curve, R18.4 for cohomology where consumed, and GZ.3 for the modular quotient
and differential comparison. Keep Brooks §2.8's precise M_f normalization
as a separately verified source obligation where it exceeds the suppliers.
These references are plans, not implementation certificates. HE.1 already
constructs quaternionic CM points and rational Hodge-normalized Jacobian
classes; import them and leave the Skinner-specific comparison in the Part II.

### /4 — Shared Cassels–Tate theorem remains unassigned

The current item 74 acknowledges the unplanned pairing but provides no
standalone theorem or reusable owner. The only item named as a pairing is
the different Néron–Tate pairing (67). Poonen–Stoll §1 recalls the elliptic
Cassels theorem: alternation and nondegeneracy after quotient by the maximal
divisible subgroup. It carefully distinguishes the general polarized case.

The argument uses finite cotype and the one-dimensional p-torsion of the
p-infinity Selmer group. The finite cyclic alternative would force rank
zero and identify that finite group with the p-primary Sha group. An
alternating nondegenerate pairing on this finite odd-p group excludes a
nonzero cyclic group. Thus the Selmer group has the required divisible
rank-one form. This argument does not assume global Sha finiteness or
assert that rank-one Selmer alone already proves rank-one Mordell–Weil.

Read Selmer L1/L2 and the complete gap record in
`research/blueprint/packets/ArithmeticStatistics.json` titled
“Cassels–Tate pairing and its isogeny adjointness”, needed by
`ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`. Add source-qualified
pairing/kernel/alternation items and the finite odd-p consequence as one
shared source/extension request at Selmer L1–L2, importing the general
ArithmeticGaloisDuality machinery. Coordinate the statistics request and
have RankOneConverse consume it. A modern source's recall of Cassels/Tate
must not be represented as a fresh proof of every original construction.

### /5 — Modularity is an input to A′, not the whole deduction

Item 64 currently attributes the entire converse assembly to R29.6. That
contract supplies modularity and full local-factor/L-function comparison,
and expressly excludes inferring a rank formula from modularity. Split the
R29.5–R29.6 imports, item 63's local-component dictionary, and the isogeny
comparison of rank and Sha finiteness from the final application of A.
Make the assembly missing and route it exactly once to RankOneConverse.
No new roadmap or duplicate proof of modularity is required.

### /6 — Provenance and local-condition terminology

Skinner reference [23], p. 353, gives Serre **123–201**; the extraction's
323–401 is wrong. Preprint p. 16 uses `Sigma,Hida`, the older theorem/section
numbers and smaller coefficient rings; published p. 346 uses `Sigma`,
Theorem 1.2/§7.5 and the unramified coefficient extension. Choose publication
notation consistently or provide an explicit dictionary, and remove item
46's obsolete note. No additional proof of Wan's theorem is certified here.

At published p. 339, the displayed group is the kernel of restriction at
the displayed p-adic prime: strict there, relaxed at its conjugate. Correct
both route-0's brief and the reader report, retaining item 49's correct
explanation. Preserve the substantive coefficient-ring correction.

## Library and owner checks

Both shared library checkouts were confirmed at the prescribed full hashes:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Read the relevant reviewed audit
entries for DT.3, R18.1/3/4 and Selmer L1/L2. R29.6 has no entry under that
exact ID; this absence alone proves nothing about implementation.

Read the pinned statements for Tau Ceti's `selmerGroup₂` (explicit
2-descent), Mathlib's `PontryaginDual` (continuous characters), the
power-series Noetherian/UFD instances (the latter assumes a principal
coefficient domain), and Tau Ceti's fixed-level
`Newform.eq_of_forall_notMem_eigenvalue_eq`. None supplies the missing
odd-p Cassels–Tate or logarithm theorem. A focused Cassels–Tate name/text
search found no corresponding development in either tree; a name search
is not a proof that all reusable algebra is absent.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-SKINNER-20.review.json`.
- `python3 research/blueprint/intake.py check-files` on the two authorized deliverables.
- JSON parsing, exact six-finding coverage and `git diff --check`.

No Lean file is part of this job. No Lean compiled, project created,
dependency cache downloaded or library build run.
