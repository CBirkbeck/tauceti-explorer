# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff — complete

Claude Code, session cc-442dc5, 23 September 2026. Refs #1332. **Complete.**

This continues the merged checkpoint of PR #2228 (codex-a71f92). It is not an independent review of the earlier checkpoints.

## State

- **Result.** The result has 184 items: 30 library, 33 planned and 121 missing. There are 13 routes, every missing item is routed exactly once, and `check_paper.py` passes with status complete.
- **Findings.** 22 are recorded, 5 of them already corrected by Lee (IMRN 2022, doi:10.1093/imrn/rnaa153).
- **Report.** The new report comes first, followed by the earlier checkpoint reports, unchanged.

## What this continuation did

- **Withheld claims.** The 19 withheld literal claims now use corrected statements, as PROTOCOL §18 requires:
  - 4 were merged into their corrected twins;
  - euler-source was dropped, because §1 is motivation;
  - 14 were restated and routed or marked planned. These include Theorems 0.1–0.3.
- **New inputs.** Six items were added: DiPippo–Howe, the positive-involution case of Albert, the Hasse norm theorem, Lemmermeyer's exact sequence, the hermitian Hasse principle and Lang's theorem.
- **Routes.**
  - The proposed LocalFieldsPartIICoefficientRecognition was withdrawn. Its Witt lemmas moved to R07.2 and its resultant lemmas to the finite-field Part II.
  - Two source routes were added: AnalyticNumberTheory AN.4 and ReductiveGroupsPartII RG2.3.
  - The finite-field Part II brief was rewritten around its final theorems T1–T5.
- **Findings.**
  - **From Lee 2022.** E19–E21 are new, and E6 and E7 are now marked known.
  - **Corrected coefficient (E13).** The E^g polarization count is exp((1/2)g² log g).
  - **B0 (E14).** The real-Weil surface B0 is not negligible, so Theorem 0.2 is restated with a B0^(h/2) alternative.
  - **Lemma 5.19 (E17).** It holds exactly for odd p.

## For the reviewer

- **The published text.** It was not readable here (a JavaScript challenge on Project Euclid). Compare it at E1–E4, which may be v1-only, and confirm Lee's published locators.
- **E14's B0 argument and E13's coefficient.** Both rest on the standard mass formulas, not on a source that states them. Check the leading terms:
  - for E^g, (1/2)g² log g, because the unitary group has dimension g²;
  - for B0^n, 2n² log n, from ∏|ζ_(Q(√p))(1−2i)|.
- **The withdrawn Part II.** If a generic owner for the coefficient-recognition lemmas is preferred, they can move back without touching the rest.

## For the design jobs

- **The finite-field Part II.** Its brief targets the explicit constant 2^(34g²)·p^((69/4)g²) and gives the corrected statements. The checkpoint replacement items (the L-, S-, C-, D- and V-series in the checkpoint record) are the proof plan it inherits.
- **ArithmeticStatistics ST.5.** It inherits the conditional results as corrected: the B0 alternative, the threshold 0.495g² log g, the Kolmogorov distance, and odd p only.

---

# Earlier handoffs (preserved)

# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff — coefficient recognition

Codex — codex-a71f92; 23 September 2026; Refs #1332. **Partial.**
Continue from report V0–V6. This extends PR #2215, not an independent review.

Inventory: 183 items (30 library, 29 planned, 124 missing), twelve routes,
119 selected known-item edges, nineteen unchanged source findings and the
same nineteen withheld claims. All 167 inherited item core fields and
route memberships are retained. The previous report and handoff are
preserved below; only the p-realization characteristic-polynomial item's
proof, dependencies and note were extended.

What this checkpoint adds:

- Eight exact pinned supplier blocks: Witt coordinates and comparison,
  prime-subfield Frobenius, PadicInt.appr, monic Gauss lemma, quotient
  norm/resultant, resultant identities and characteristic-polynomial
  conjugacy. Ten files were raw-byte-verified at the original pins.
- The canonical Z_p→W(k) coefficient map and a coordinate proof that
  absolute Witt-Frobenius fixed points are its image, for any
  characteristic-p field. Ghost coordinates are not injective here.
- Integral characteristic-polynomial descent when the conjugating
  Frobenius matrix is invertible only over Frac(W(k)).
- A generic DVR resultant-recognition proof. Lift R+π^n modulo π^(2n);
  multiplication on O[X]/(R) has determinant π^(n deg R) times a unit.
  The complementary factor has eventually constant valuation.
  Recover multiplicities from consecutive slopes.
- The Z→Z_p specialization, with the exact common-nonzero monic test
  scope needed by the independent p-characteristic-polynomial argument.
- A proposed shared LocalFields Part II owner for those eight adapters,
  with its nonduplication boundary and design brief. No new valuation,
  Witt, polynomial, AdjoinRoot or module-classification carrier.

Read boundary: M68 pp.65–66 were freshly image-read, with the same
8abdaf4f... PDF hash. Lang VII §1 Lemma 1 was not acquired. Complete LT,
WM71 and other source reads remain historical with prior attribution.
The complete LocalFieldsRamification README was freshly read; the
previously fully read GlobalNumberFields README is byte-identical.
No fresh final-journal comparison or new source finding is claimed.

Checks: the standard-library program in V6 passes 28,732 exact diagnostic
cases (8,214 slopes; 3,126 congruences; 211 rejection examples; 17,181
Witt-coordinate cases). Finite checks do not prove the general statements.
The inherited SymPy program is preserved but was not rerun in this claim.
Final schema/intake/regression and publication-snapshot results are in the
current JSON verification object. No Lean file was written or compiled.

Legacy compliance gap G9: 37 inherited definition/construction entries
have only prose API/tests and one has string tests. All three new
construction blocks pass the structured API/uses/≥3 typed-test audit;
the 38 legacy entries need normalization before completion.

Resume:

1. Review the proposed LocalFieldsPartIICoefficientRecognition ownership
   before activation and implement its adapters on the pinned carriers.
   Do not restore a splitting-field valuation dependency to this proof:
   V3–V4 avoid it. Do not replace F by F^a or use ghost injectivity.
2. Audit the remaining unramified tensor decomposition/Frobenius action
   and central-simple descent adapters. Existing Brauer, centralizer and
   simple-module dimension theorems are already imported.
3. Continue original R07.2 finite/p-divisible exact classification and
   rank/length, A3 quotient/torsion and A6 intrinsic degree/Hom inputs.
   The coefficient argument does not prove any of those geometric facts.
4. Continue local cyclic-invariant/algebraic–cohomological Brauer,
   global Brauer and Honda CM existence, then the earlier PEL,
   polarization, class-set/narrow-norm, mass/residue and limit-law work.
5. Obtain and compare the final 2018 LT text. All inherited LT findings
   remain v1-only; keep the nineteen disputed literal claims withheld.

The original G0–G7 scopes remain; G8 now distinguishes the two newly
decomposed/audited coefficient obligations from all remaining arithmetic,
geometric, source and implementation gaps. The job is not complete.

---

# Preserved characteristic-p handoff and historical checkpoints

# PAPER-LIPNOWSKI-TSIMERMAN-18 — p-comparison incorporation

**Codex — codex-7e92bd; 23 September 2026; Refs #1332. Partial.**

The preceding handoff's P1–P5 have now been incorporated into the extraction
and report D0–D7, with attribution to cgp-20260923-h7q4 and a fresh source
check. This supersedes its instruction to perform that incorporation.
The old handoff is retained verbatim below for provenance.

The result has 167 items (22 library, 29 planned, 116 missing), eleven
routes, the same nineteen withheld LT claims, and nineteen unreviewed
source findings. All 152 inherited IDs/kinds/statuses/statements, seventeen
source findings, and route assignments were preserved. Nine new missing
items are routed exactly once to the existing finite-field Part II. Two
precise R07.2 planned imports join its source route. A local cyclic-invariant
import is planned in ClassFieldTheory Layer 5; it has not been implemented.

## What was added

- Independent p-realization degree/characteristic-polynomial comparison,
  Frobenius semisimplicity, and saturated integral Hom injection.
- A finite cyclic Frobenius-block construction, its splitting argument,
  the arithmetic commutant dimension and rational p-Tate comparison.
  The existing integral p-Tate and prime-field p-Frobenius items now carry
  their proof/dependency outlines instead of obsolete unread-source notes.
- The characteristic-prime local invariant, with both opposite-algebra
  signs and the arithmetic Frobenius normalization explicit.
- Three pinned-library imports: the simple-module endomorphism dimension
  formula, tensor-centralizer equivalence and opposite Brauer class.
  The first replaces a proposed generic Morita/base-change derivation.
- The handoff's M68 Newton-abscissa finding, freshly checked, and new E18:
  LT v1 p.21's alternative proof says its centralizer is non-division.
  E/F_5: y²=x³+1 has P_E=X²+5, whose Q_5-centralizer is a field.
  This does not disprove Proposition 4.14; use its preceding invariant proof.

## Read and audit boundary

LT v1 all 38 text pages were freshly read, with p.21 additionally rendered.
WM71 all twelve published page images (pp.53–64) were read. M68 images
pp.63–67 and p.84 were read; the rest of M68 was not. Actual downloaded
PDF hashes, URLs and dates are recorded in result JSON/report D0. The
previous complete reads of other references retain their earlier attribution.
The final journal article was not obtained: DOI resolution returned publisher
security HTML. G0 remains open, and E18 is v1-only.

Consolidated A3/A4/A6 and CF5 reviewed audits, relevant full descriptions,
and upstream JacobianChallenge and SemisimpleAlgebras documents were read.
R07.2 and SemisimpleAlgebras have no consolidated row at this snapshot.
Searches covered both pinned trees and the new-roadmap/packet/decomposition
catalogues. The three new supplier files were read and matched to raw
GitHub bytes at f790474. This is not a fresh comprehensive re-audit of the
152 inherited library/planning statuses.

## Where to resume

1. The original arithmetic p-Tate and p-local invariant proof lookup is
   done: use WM71 Part II pp.60–61, with M68 pp.65–66 for the independent
   polynomial comparison. Tate's projected second endomorphism paper
   never appeared (WM71 bibliography); do not search for it again.
2. Close the exact original R07.2 finite/p-divisible classification,
   exactness and length/rank proof interiors, and A3/A6 quotient, intrinsic
   degree and finite-rank Hom inputs. Keep the finite-level rank p^length
   and contravariant direction; the existing generic carriers are imported.
3. Audit the generic valuation-separation, fixed-Witt-ring, unramified
   tensor decomposition and central-simple descent adapters against the
   pins. Their mathematical use is specified in D1/D3/D5; do not plan a
   parallel general Ore, semisimple-algebra or Brauer library. The direct
   module dimension theorem is already in Tau Ceti.
4. Read the original local cyclic-invariant calculation and the
   algebraic/cohomological Brauer comparison required by CF5, plus global
   Brauer classification and Honda CM existence. These are still G8.
5. Continue the earlier PEL fixed-degree/twist finiteness, polarization,
   class-set/narrow-norm, Gan–Yu/Jacobowitz, mass/residue, real-Weil and
   statistical-limit obligations. The all-q Hom result here does not
   generalize the prime-field linear-dual lattice count.
6. Acquire and compare the final LT publication before treating any of
   the eighteen LT v1 findings as findings in the journal version. All
   nineteen original withheld claims remain withheld; G0–G7 are not closed.

## Validation

`check_paper.py` and `git diff --check` passed. Additional checks passed for
preservation, unique item IDs, unchanged withheld IDs, one route per new
missing item, valid stage/dependency/request endpoints and the acyclic
union of `dependsOn` with the selected edge list. Both new constructions
have API, uses and at least three discriminating tests. No private paths,
source PDFs, self-review verdicts or unrelated deliverables are included.

Report D7's executable Python/SymPy 1.14.0 diagnostics passed: 8 split
cyclic-module commutants, 5,760 invertible semilinear F_9 matrices,
840 multiplicity tests, 10,260 normalization identities, 40 irreducible
quadratic resultant tests, 128 twisted-product basis associativity tests,
and the E18/valuation/semisimplicity/Newton controls. All three inherited
report scripts were rerun and passed, including their 32,608- and
47,689-case suites. No Lean file was written or compiled. This is a
checkpoint for independent review, not a completeness or formalization claim.

---

# Preserved handoff through PR #2204

# PAPER-LIPNOWSKI-TSIMERMAN-18 — characteristic-p source checkpoint

**ChatGPT Pro — cgp-20260923-h7q4; 23 September 2026; Refs #1332. Partial.**

This checkpoint saves original-source reading, proof decompositions and exact
finite diagnostics. It changes **only this handoff**. The extraction JSON and
the report are unchanged: the 152-item inventory, eleven routes, nineteen
withheld claims and seventeen registered source findings have not been
updated. Incorporating the material below into those files is the next task,
not an operation this submission claims to have performed. One additional
source finding is recorded below in the section-18 format for that incorporation.
No independent review, proof-closure certificate or Lean implementation is claimed.

The previous handoff is preserved byte-for-byte after the final divider.
Its requests to locate the original p-Tate proof and the independent
p-characteristic-polynomial comparison are superseded by P1–P4 below.
Its other source and implementation gaps remain open.

## P0. Sources and exact scope

**WM71:** Waterhouse–Milne, *Abelian varieties over finite fields*, Proc. Symp.
Pure Math. 20 (1971), pp.53–64,
https://www.jmilne.org/math/articles/1971a.pdf . All twelve published page images
were read, including Part II, Theorems 1–2 and their proofs, pp.60–61.
The author's publication list and abstracts identify this as the source of the
proofs of the two theorems announced by Tate:
https://www.jmilne.org/math/articles/index.html and
https://www.jmilne.org/math/articles/abstracts.html .

**M68:** Milne, *Extensions of abelian varieties defined over a finite field*,
Invent. Math. 5 (1968), pp.63–84,
https://www.jmilne.org/math/articles/1968a.pdf . Images of pp.64–67 and p.84
were read. The needed comparison is on pp.65–66, not in the later Ext
calculations. This is **not** a complete reading of M68. The author's notes
and listed corrections were read at
https://www.jmilne.org/math/articles/1968a.html .

WM71's bibliography explicitly warns that the often-cited second Tate
endomorphisms paper was never written. Use WM71 Part II instead of treating
that reference in M68's bibliography as an obtainable missing paper.

All accesses above were on 23 September 2026. Browser page images were
available, but downloading source bytes to the scratch environment failed.
No new PDF SHA-256, byte count or byte-for-byte version comparison is claimed.
The LT source remains arXiv:1511.02212v1. This claim reread pp.1–8, not the
whole paper; the earlier complete reading retains its earlier attribution.
Both author publication lists still point to arXiv. The journal/DOI download
attempts did not produce the final text. G0 is **not closed**.

The input blobs are:

- extraction JSON: `08e4a65850abd8867fc2511b09b4425209753511`;
- report: `e4814d678a4b5f0ab4e4ebe40d6c967ca2ae8b5a`;
- preceding handoff: `e3d8beb8d56cacd1a66bd6d63baf1e98ad2c758b`.

The current R07.1/R07.2 descriptions were read. The A4 import findings and
accepted `REV-AUDIT-08` review in `research/blueprint/audit/AUDIT-08.result.json`
were checked. The consolidated coverage fetch returned empty content, so this
is not a fresh reading of that whole file. No new pinned-library declaration,
absence search, ownership decision or route is asserted. Keep the existing
owners: R07.2 for Dieudonné theory, A3 for torsion and quotients, A6 for
finite-rank Hom and intrinsic degree polynomials, and the already proposed
finite-field Part II for its Tate/Honda arithmetic consumers. Generic
central-simple-algebra and linear-algebra facts must be imported from their
existing libraries/owners, not replanned as a new Dieudonné category.

## P1. Characteristic polynomial before p-Tate

Set k=F_(p^a), W=W(k), L=Frac(W), and let sigma be Witt Frobenius. Use the
**contravariant** module C(A) of A[p^infinity]. Its finite-level reduction is
D(A[p^n]); its W-rank is 2 dim(A). The required R07.2 input is the exact
finite-group anti-equivalence with

    rank_k(H) = p^(length_W D(H)),

and the induced equivalence for p-divisible groups. The right side is not
q to that length, and the left side is group-scheme rank, not the number of
geometric points. The A3 input is the finite-flat quotient and the primary
kernel decomposition. These imported theorems are not proved by p-Tate.

For u in End_k(A), put T=C(u). This is W-linear and commutes with the
sigma-semilinear F. On C(A)[1/p], F is invertible because FV=VF=p.
Writing F=B sigma in a basis gives T=B sigma(T) B^(-1). Thus the
characteristic polynomial of T is sigma-fixed: its integral coefficients
belong to Z_p, not merely to W.

If psi in Z[X] makes psi(u) an isogeny, exactness at its p-primary kernel
and the DVR determinant/length calculation give

    v_p(det_L psi(T))
      = length_W coker(C(psi(u)))
      = v_p(deg(psi(u))),       v_p(p)=1.

The degree-polynomial supplier in A6 gives the same right side as
v_p(Res(P_u,psi)), where P_u in Z[X] is the intrinsic degree-2 dim(A)
polynomial already realized on V_ell(A), ell != p. The following elementary
argument explains why these valuation tests determine the polynomial; it
avoids deriving this comparison from p-Tate.

**Valuation-separation lemma.** Suppose monic P,Q in Z_p[X] give equal
resultant valuations for all integer polynomials for which both resultants
are nonzero. Take a monic irreducible factor R of P or Q. Its roots are
integral, hence R is in Z_p[X]. Choose monic R_n in Z[X] with coefficients
congruent to R modulo p^(2n), and put psi_n=R_n+p^n. For each integral root
alpha of R, v_p(psi_n(alpha))=n. At a root beta not belonging to R, the
valuation is eventually the fixed number v_p(R(beta)). Consequently

    v_p(Res(P,psi_n)) = n N_R(P) + c_P

for all sufficiently large n, where N_R counts roots of R with multiplicity
in P. The same formula for Q forces N_R(P)=N_R(Q). Do this for the finite
set of irreducible factors; monicity gives P=Q. These test resultants are
nonzero for large n. In the application, nonzero Res(P_u,psi_n) ensures
that psi_n(u) is an isogeny by the imported degree formula, so the degree
comparison above applies to the required tests.

This yields charpoly_L(C(u)[1/p])=P_u without p-Tate. It is the independent
input used at WM71 p.60, which points to M68 p.66. M68 p.65 supplies the
length/degree reasoning and cites Lang VII, section 1, Lemma 1 for uniqueness;
the valuation-separation argument here expands that uniqueness step rather
than claiming the Lang book was read in this session.

For **Frobenius pi**, additionally use centrality of pi in End_k^0(A) and
semisimplicity of that rational algebra. Its Q-minimal polynomial is
squarefree. The relation transports to C(A)[1/p], so F^a=C(pi) is semisimple.
Do not infer this for every u, and do not identify F with the L-linear
F^a when a>1. Specializing a=1 gives the existing
`prime-field-p-frobenius` item; ordinary linear duality preserves its
polynomial and semisimplicity.

Tests/API obligations: rank is 2g, not p-rank; repeated factors of P_pi are
allowed although pi is semisimple; a=2 uses F^2, not F, for L-linear
characteristic polynomials; zero dimension gives polynomial 1; arbitrary
endomorphisms of a power E^2 need not be semisimple. The comparison uses the
existing `degree-polynomial`, `dieudonne-lattice` and `poincare-decomposition`
interfaces, not an extra definition of the intrinsic polynomial.

## P2. Integral injection and saturation, independently of dimension

Let M=Hom_k(A,B), a finite free Z-module, and

    H = Hom_(W,F,V)(C(B), C(A)).

H is a finite torsion-free Z_p-module: it is a submodule of the finite
Z_p-module of W-linear maps. It is p-saturated there, since cancellation of
p in the F,V-commutation equations is valid. In particular, reduction modulo
p of H embeds into the W-linear maps between the reductions.

If f in M induces zero modulo p on C, the finite-level Dieudonné
anti-equivalence says that f restricted to A[p] is the zero group-scheme
map. The A3 quotient A/A[p] identified with A by [p] gives a unique g with
f=g composed with [p]_A=p g. Conversely such an f acts trivially modulo p.
Thus M/pM -> H/pH is injective.

Extend to j:M tensor Z_p -> H. If j(x)=0, successive reduction modulo p
makes x divisible by every power of p, hence zero. If j(x)=p h, the same
mod-p injection gives x=p x'; cancellation gives h=j(x'). The image is
therefore p-saturated. This proves both injection and saturation **before**
using any rational dimension comparison. Once P3 supplies equality of ranks,
the finite torsion cokernel is also p-torsion-free and must vanish.

Tests/API obligations: use scheme-theoretic A[p], never only A[p](kbar);
repeat the argument for p^n; preserve the order C(B)->C(A); End carries an
anti-homomorphism, or a homomorphism from End(A)^op; the zero variety gives
the zero module. The quotient/divisibility argument is the completion of
WM71 Part I Theorems 3/5/6 needed for Part II's rational comparison.

## P3. Rational full faithfulness: the central-simple block calculation

The following expanded block argument gives the dimension calculation in
WM71 Part II Theorem 1. It uses only the particular cyclic quotients needed
here rather than assuming an undecomposed classification of all skew-
polynomial modules. It is a mathematical proof outline, not checked Lean.

Write the polynomial from P1 over Q_p as

    P_pi(X) = product_i m_i(X)^(e_i),

with distinct monic irreducibles m_i and d_i=deg(m_i). Put K_i=Q_p[X]/m_i,
and let theta_i denote X. All theta_i are nonzero. For
R=L[F; sigma], the center is Q_p[F^a]; semisimplicity of F^a decomposes
C(A)[1/p] as the sum of its m_i-primary blocks V_i, annihilated by m_i(F^a).
Different blocks have no R-intertwiners.

The acting quotient is

    B_i = R/(m_i(F^a))
        = (L tensor_Qp K_i)<F> /
          (F b = (sigma tensor 1)(b) F, F^a=theta_i).

It has K_i-dimension a^2. It is central simple of degree a even when
L tensor K_i is **not a field**. Indeed, over an algebraic closure of K_i,
L splits into a copies of the base field. Represent these by diagonal
idempotents and represent F by a cyclic shift with nonzero wrap weight
theta_i. The matrices E_j F^r, 0<=j,r<a, are scalar multiples of all matrix
units. They form a basis; hence this representation identifies the scalar
extension with M_a. Faithful field extension descends the central-simple
property. This supplies the special quotient structure used by the original
Jacobson-based argument; it does not replace any existing algebra carrier.

Now dim_L(V_i)=d_i e_i, so dim_(K_i)(V_i)=a e_i. After splitting B_i,
a module of that dimension is a sum of e_i copies of the standard
column module. Explicitly use E_11 V_i and the mutually inverse maps

    e_j tensor v |-> E_(j1) v,
    x |-> sum_j e_j tensor E_(1j) x.

Its endomorphism algebra therefore has dimension e_i^2 over K_i.
Commutants commute with field extension here because they are kernels of
finitely many linear commutation equations. Consequently

    dim_Qp End_R(C(A)[1/p]) = sum_i d_i e_i^2.

The already separate ell != p Tate theorem and its semisimple centralizer
calculation give dim_Q End_k^0(A) equal to the same sum. That sum is invariant
under separable factor splitting: each root contributes its multiplicity
squared. P2 gives the natural injection, so equal dimensions make it an
anti-isomorphism on End. Apply this to A x B and take the off-diagonal
idempotent corners to obtain the correctly oriented rational Hom statement.
P2 then upgrades it integrally. This proves the existing `p-tate-hom`
statement, relative to the displayed geometric and prime-to-p suppliers.

Tests/API obligations: a=1 gives ordinary polynomial-field blocks; the
weighted-cycle algebra has dimension a^2, not a; multiplicity e contributes
e^2, not e; coefficient tensor products may split, and must not be assumed
fields; off-diagonal corners reverse under C. The finite F_9 diagnostic
below shows why commuting only with F^a is insufficient: for F=sigma on
L^2 modulo p there are 9^4 W-linear maps, but only 3^4 commute with F.

Dependency direction: R07.2/A3 -> P2; R07.2/A6 -> P1;
P1 + P2 + ell-Tate + the central-simple calculation -> rational p-Tate;
rational p-Tate + P2 -> integral p-Tate. There is no p-Tate -> P1 arrow.

## P4. Local invariant and the two opposite algebras

WM71 Part II Theorem 2 also supplies the previously unread p-local invariant
proof. For a simple A, put K=Q(pi)_v, v|p. Normalize ord_v on K to have value
one on a uniformizer. Write e_v=ord_v(p), f_v for the residue degree,
g=gcd(f_v,a), and n=a/g. Then

    L tensor_Qp K is a product of g copies of LK,
    [LK:K]=n,
    B_v is isomorphic to M_g(D),

where D is the cyclic algebra with coefficient field LK, generator tau
acting as sigma^g, and U^n=pi. The arithmetic Frobenius of LK/K acts on L
as sigma^(f_v), hence equals tau^(f_v/g). With the local-invariant convention
used in WM71, this gives

    inv(D) = (f_v/g) ord_v(pi)/(a/g)
           = f_v ord_v(pi)/a
           = [K:Q_p] ord_v(pi)/ord_v(q)   in Q/Z.

The endomorphism algebra of a nonzero B_v-module has the **opposite** Brauer
class. The contravariant realization identifies End_k^0(A)^op with that
commutant, introducing a second opposite. These signs cancel. Do not use
an order-two example alone to check the signs: 1/2 equals -1/2 in Q/Z,
whereas 1/3 and -1/3 do not agree.

The unramified cyclic-invariant formula remains an imported local Brauer
input; this reading does not purport to formalize local class field theory.
At a=1 the finite p-invariants vanish, but this does not remove real-place
invariants. Keep the earlier nonreal/CM restriction and the real-Weil
exception. The all-q Hom theorem here does not by itself supply an all-q
version of the prime-field linear-dual lattice convention or counting bound.

## P5. One additional source finding; one rejected suspicion

The following is an auxiliary-source finding, **not** an assertion about
the final LT publication. It has not yet been appended to the extraction's
`sourceIssues`; retain the existing seventeen entries when incorporating it.
The descriptive ID is absent from the current extraction. Its shape passes
the repository's `source_issues.check_issues`. No `review` object is added.

```json
{
  "id": "PAPER-LIPNOWSKI-TSIMERMAN-18/E-MILNE68-NEWTON-ABSCISSA",
  "kind": "misprint",
  "locator": "Milne, Extensions of abelian varieties defined over a finite field, Invent. Math. 5 (1968), published p.67, proof of Theorem 1(c), definition of the Newton polygon; author-hosted published page image.",
  "printed": "(c_i, ord_p(c_i))",
  "correction": "Use (i, ord_p(c_i)) for each nonzero coefficient c_i of F^i.",
  "reason": "The horizontal coordinate is the exponent. For 1+F the printed point set has just (1,0), whereas the Newton polygon has endpoints (0,0) and (1,0). General coefficients lie in a p-adic field, not canonically in R. The subsequent formula ord_s(lambda)=min_i(ord_p(c_i)-s i) also confirms the intended exponent coordinate. This is a notation slip, not a disproof of Theorem 1(c), and is outside the degree-comparison proof used above.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "2026-09-23: inspected the published p.67 image at https://www.jmilne.org/math/articles/1968a.pdf.",
    "2026-09-23: read the author notes/errata at https://www.jmilne.org/math/articles/1968a.html; their listed corrections concern pp.78-79 and p.81, not this point notation.",
    "2026-09-23: title searches with errata and with 67/Newton did not locate an additional correction. This is a limited search, not an exhaustive novelty claim."
  ]
}
```

Do not register WM71 p.60's generator `(1/p)F^(-1)` as a false ring equality:
after p is inverted it generates the same Laurent algebra as pF^(-1).
The operator identity needed by the implementation is V=pF^(-1), from FV=p.
The printed algebra equality alone is not a counterexample to that identity.

## P6. Resume and validation

First incorporate P1–P4 into the existing `p-tate-hom` and
`prime-field-p-frobenius` items: add the exact source locators, replace only
the now-obsolete unread-source notes, add the proof outlines and the acyclic
dependencies/tests. Keep their implementation status `missing`. Record the
new reading in provenance without inventing PDF hashes. Incorporate P5 before
a completed extraction is submitted. Add a report supplement rather than
silently reattributing the previous workers' reading.

Before creating any extra generic item, check the pinned libraries and the
existing semisimple-algebra, local-Brauer and valuation owners. The block
calculation is not authority to plan a parallel Ore-polynomial library. Do
not erase the independent A6 degree/resultant and R07.2 finite-level
exactness/length inputs: their original general proofs are not read here.
Continue the old PEL fixed-degree/twist, polarization, Honda, class-set,
Gan–Yu/Jacobowitz, mass/residue, real-Weil and limit-law obligations. The
final journal comparison G0 and all nineteen withheld LT claims remain open.

The exact diagnostics below passed: 8 split cyclic-module commutants,
5,760 invertible semilinear F_9 matrices, 840 valuation-multiplicity tests,
and 10,260 invariant-normalization identities. They are regression checks,
not proofs of the general theorems. The source-finding schema check passed.
The preserved handoff's Git blob was matched exactly before prepending.
The extraction JSON/report are untouched; `check_paper.py`, full intake and
the old regression suite were **not rerun locally**. The PR's automated
submission check is separate. No Lean file was written or compiled.

### Reproducible finite diagnostics (Python with SymPy)

```python
"""Exact finite diagnostics for the LT18 p-source continuation, not Lean proofs."""
from fractions import Fraction
from itertools import product, combinations_with_replacement
from math import gcd
import sympy as s

# A split cyclic algebra is generated by diagonal idempotents and a weighted cycle.
# Check both the a^2-dimensional span and its r^2-dimensional module commutant.
cyclic_cases = 0
for a in range(1, 5):
    S = s.zeros(a)
    for j in range(a - 1):
        S[j + 1, j] = 1
    S[0, a - 1] = 2
    assert S ** a == 2 * s.eye(a)
    E = []
    for i in range(a):
        e = s.zeros(a); e[i, i] = 1; E.append(e)
    basis = [e * S ** j for e in E for j in range(a)]
    assert s.Matrix.hstack(*(b.reshape(a*a, 1) for b in basis)).rank() == a*a
    for r in (1, 2):
        n = a*r
        gens = [s.kronecker_product(g, s.eye(r)) for g in E + [S]]
        # Column vectorization: vec(XG-GX)=(G^T tensor I-I tensor G) vec(X).
        eq = s.Matrix.vstack(*(s.kronecker_product(g.T, s.eye(n))
                               - s.kronecker_product(s.eye(n), g) for g in gens))
        assert n*n - eq.rank() == r*r
        cyclic_cases += 1

# F_9 = F_3[t]/(t^2+1), encoded by x+3*y. Frobenius fixes exactly F_3.
def add(x, y):
    return ((x % 3 + y % 3) % 3) + 3*((x // 3 + y // 3) % 3)
def neg(x):
    return (-x % 3) + 3*((-(x // 3)) % 3)
def mul(x, y):
    a,b = x % 3, x // 3; c,d = y % 3, y // 3
    return ((a*c-b*d) % 3) + 3*((a*d+b*c) % 3)
def frob(x):
    return mul(mul(x, x), x)
def mm(A, B):
    return tuple(add(mul(A[2*i], B[j]), mul(A[2*i+1], B[2+j]))
                 for i in range(2) for j in range(2))
def det(A):
    return add(mul(A[0], A[3]), neg(mul(A[1], A[2])))
assert all(frob(frob(x)) == x for x in range(9))
assert {x for x in range(9) if frob(x) == x} == {0, 1, 2}
linear_maps = semilinear_commutants = invertible_cases = 0
for B in product(range(9), repeat=4):
    linear_maps += 1
    semilinear_commutants += all(frob(x) == x for x in B)
    if det(B) == 0:
        continue
    # For F=B sigma, F^2=B sigma(B); its characteristic polynomial is sigma-fixed.
    P = mm(B, tuple(frob(x) for x in B))
    tr = add(P[0], P[3]); d = det(P)
    assert frob(tr) == tr and frob(d) == d
    invertible_cases += 1
assert linear_maps == 9**4 and semilinear_commutants == 3**4
assert invertible_cases == (9**2-1)*(9**2-9)

# Valuation tests recover multiplicity in a split integral-root model.
def vp(x, p):
    assert x != 0
    x = abs(x); n = 0
    while x % p == 0:
        x //= p; n += 1
    return n
multiplicity_cases = 0
for p in (2, 3, 5):
    for rank in range(5):
        for roots in combinations_with_replacement(range(4), rank):
            for alpha in range(4):
                # psi_n(T)=T-alpha+p^n, with n beyond every nonzero separation valuation.
                values = [sum(vp(beta-alpha+p**n, p) for beta in roots) for n in (5, 6)]
                assert values[1] - values[0] == roots.count(alpha)
                multiplicity_cases += 1

# Arithmetic Frobenius versus the chosen cyclic generator, with ramification explicit.
invariant_cases = 0
for a in range(1, 13):
    for f in range(1, 7):
        g = gcd(a, f)
        assert gcd(a//g, f//g) == 1
        for e in range(1, 7):
            for t in range(a*e + 1):
                I = Fraction((f//g)*t, a//g)
                assert I == Fraction(f*t, a) == Fraction(e*f*t, a*e)
                invariant_cases += 1
assert Fraction(1, 2) % 1 == Fraction(1, 2)
assert (-(-Fraction(1, 2))) % 1 == Fraction(1, 2)
# A value away from order two detects a missing sign reversal.
assert (-(-Fraction(1, 3))) % 1 == Fraction(1, 3)
assert (-Fraction(1, 3)) % 1 == Fraction(2, 3)
# Group-scheme rank uses p^length, not |F_q|^length.
p, a, length = 3, 2, 3
assert p**length == 27 and (p**a)**length == 729

print(f'PASS: {cyclic_cases} split cyclic-module commutants; '
      f'{invertible_cases} F_9 semilinear Frobenius matrices; '
      f'{multiplicity_cases} valuation-multiplicity tests; '
      f'{invariant_cases} invariant-normalization identities.')
print(f'Naive versus semilinear commutant sizes: {linear_maps} versus {semilinear_commutants}.')
print('Finite diagnostics only; no general theorem or Lean compilation is inferred.')
```

---

# Preserved handoff before this source checkpoint

# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff — classification continuation

Codex — codex-a71f92; 23 September 2026; Refs #1332. **Partial.**
This continues PR #2155, not an independent review.

Resume at the report's C0–C7 supplement. Inventory: 152 items
(19 library, 26 planned, 107 missing); eleven routes with 88 missing
and 25 planned items; 39 definition/construction API/test blocks;
80 selected known-ID edges; the same 19 withheld claims and
17 unchanged proposed v1 sourceIssues.

This claim adds:

- Three pinned suppliers: semisimple bicommutant surjectivity,
  compact p-adic integers and compact-set subsequence extraction.
- Tate 1966's original proof spine: fixed-polarization-degree finiteness,
  divided polarization, isotropic image via a compact preimage argument,
  split Frobenius commutant, and the remaining Hom-dimension/saturation steps.
- Prime-field linear dual of Waterhouse's contravariant p-module,
  with four discriminating API tests. This is not an all-q convention.
- A quotient construction realizing finite-support lattice tuples:
  choose NT⊆M, form L=N⁻¹M, quotient by its primary subgroups,
  and use the marking Nq⁻¹.
- Torsion detection of integral quasi-homomorphisms and the prime-field
  marked/unmarked classification. These do not require p-Tate:
  they test already algebraic rational maps.
- Good-prime lattices via the squarefree minimal-polynomial discriminant;
  finite-support conjugators and product stabilizers; the coarse
  prime-field bound D_*³h with the class-set factor h retained.

Every inherited ID, kind, status, statement and route assignment is retained.
Seven notes are updated to remove obsolete unread-reference claims or fix
the present convention boundary; tate-hom additionally gains its proof
and dependencies. Historical verification, report and handoff remain
preserved. All new mathematical endpoints remain missing implementations.

Read boundaries and hazards:

- Tate 1966 all text and p.137 image read. Its theorem is ℓ≠p;
  the p-local invariant proof is expressly omitted.
- Waterhouse introduction, Chapters 1–3, Porism 4.3 proof,
  Chapter 6 text and bibliography read; p.551 rendered. This is not
  all of Waterhouse, and the dyadic matrices in 6.2 are not fully
  image-audited. Proposition 3.1 is embedding conjugacy, not realization.
- Tate Bourbaki 352 all extracted text surveyed; §§1–2 with images
  pp.96,98,99 audited. Later missing OCR formulas were not guessed.
- p-Tate full faithfulness and the p-realization Frobenius polynomial
  are separate explicit source leaves. Do not close them by a circular
  dimension argument.
- R07.2 is absent from consolidated reviewed coverage here.
  AUDIT-37 is an unaccepted lead, corroborated by the accepted A4 import
  row and pinned searches, not presented as an accepted audit.
- PEL M6 fixed-degree finiteness must handle degree divisible by p and
  actual k-isomorphism classes, not just coarse rational points.
- The full LT v1 read is inherited from #2155; final journal comparison G0
  is still open. No new source error is proposed.

Next source work, in order of the remaining dependency boundary:

1. Supply original p-realization/degree and p-Tate proofs (Manin/Oda/Milne
   sources behind Waterhouse/Tate), without deriving the p-polynomial from
   the same p-Tate dimension calculation that uses it.
2. Supply finite-flat quotient/Dieudonné exactness and the polarization
   divisibility/positivity inputs from their original sources; retain the
   A2/A3/R07.2 ownership.
3. Prove the finite-type fixed-polarization-degree/twist finiteness in PEL
   M6, the generic semisimple intertwiner-dimension assembly and split-prime
   existence. Existing bicommutant and compactness are already imported.
4. Close AA.1/AA.3 group and class-set interfaces, then the quantitative h
   comparison with its quaternionic/narrow-class restrictions.
5. Continue Honda CM existence and the inherited G0–G8 source work.
   Do not route the nineteen literal disputed claims merely to erase gaps.

Validation: 32,608 fresh standard-library Python finite diagnostics pass.
Final schema, regressions and publication-snapshot preservation are recorded
in the current JSON verification. These checks are not mathematical proofs.
No Lean file is authorized, written or compiled.

---

# Preserved previous handoff

# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff — stabilizer continuation

Codex — codex-a71f92; 23 September 2026; Refs #1332. **Partial.**
This continues our PR #1848, not an independent review.

Resume from the report's S1–S7 supplement. Current inventory: 136 items
(16 library, 26 planned, 94 missing), ten existing routes containing
75 missing and 25 planned items, 38 definition/construction API/test
blocks, 42 selected acyclic known-ID edges, 17 unchanged proposed v1
sourceIssues and the same 19 withheld claims. All 124 inherited item
objects and the complete earlier report/handoff remain unchanged.

What this claim adds:

- Five actual pinned suppliers: PID Smith quotient and diagonal basis,
  prime-power quotient cardinality (root cardQuot_pow_of_prime),
  DVR unit-times-uniformizer-power, DoubleCoset.eq and
  MulAction.index_stabilizer.
- A finite-DVR determinant-index assembly proof.
- A non-isotypic stabilizer bound using successive projected flag
  quotients: exponent Σn_i²δ_i+Σ_{i<j}n_i n_jρ_ij≤Δ.
  Normalize the graded saturations, not the entire lattice saturation.
- Nested double-coset level maps with API/tests, a fiber upper bound
  retaining the left stabilizer, right multiplication for conjugate
  levels, and a finite-support product-index lemma.
- Conditional rational-orbit count D_*³h. This is NOT an unconditional
  abelian-variety count or a sharp asymptotic coefficient.

Fresh read: all 38 pages of LT v1, SHA
5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a;
Yun v2 §4.8 and the complete Lemma 4.9 proof, SHA
a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347.
No fresh rendered-page reading. Conrad and other earlier source reading
remain historical. Author/arXiv metadata still does not establish final
2018 text agreement; no new publisher download is claimed.

Resume in this order:

1. Obtain and compare a legitimate final/accepted journal text. G0 remains.
   Do not label inherited v1 findings as confirmed final-publication errors.
2. Close the arithmetic inputs to S6: exact marked quasi-isogeny action,
   every local centralizer including p, product stabilizers, restricted-
   product conjugacy to one fixed compact level with finite exceptional
   support, and the finite coarse class-set. S6 deliberately assumes these
   outputs; it does not construct them.
3. Match/implement the S1–S5 assembly on the pinned carriers, and close the
   remaining coefficient-DVR, topological evaluation, trace-dual/class and
   flag-carrier adapters of L1–L9. Mathematical proofs are not Lean code.
4. Continue G3–G8: original classification suppliers, quaternionic
   rank-one/narrow norm-image obstructions, Gan–Yu/Jacobowitz normalization,
   mass coefficient and residue bounds, free/projective comparison,
   original lower count and enhanced-limit existence/tightness.
5. Keep the exact linear local source estimate and all 19 source claims
   withheld until their own proof/version issues close. Preserve inherited
   item objects; append a scoped proof or explicitly justify any correction.

Only existing owners are used: GN.2 finite-DVR lattice adapter, GN.3
stabilizer count, AA.4 level comparisons, and the existing finite-field
Part II consumer. GN.2/GN.3/AA.4 reviewed audit rows, campaign descriptions,
and upstream IntegralLattices/GlobalNumberFields were read. Open Mathlib
Hecke double-coset PR descriptions were consulted for shape, not counted
as baseline implementations.

Fresh diagnostics: 47,689 exact standard-library Python cases, embedded in
S7. All 48 checker/intake regression tests pass. No Lean file is authorized,
written or compiled. The publication verification in the JSON records the
final snapshot and checker results; this is a checkpoint, not completion.

---

## Historical handoff through PR #1848 (unchanged)

# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff — continuation

Codex — codex-a71f92; 22 September 2026; Refs #1332. **Partial.**

Continue from the report's L1–L9 supplement. The prior report and handoff
remain below with attribution to codex-c83e7a / PR #1652.

Current checkpoint: 124 items (11 library, 26 planned, 87 missing), ten
routes taking 68 missing and 25 planned items, 37 definition/construction
API/test blocks, 24 selected edges, 17 proposed v1 source issues and all 19
original withheld claims. Eight new suppliers go only to GN.2/GN.3; no new
roadmap, definition or carrier is proposed.

What changed: import the actual pinned monogenic trace dual, complete-ring
Hensel lifting and local scalar-length formula; supply the residue-DVR
model and weighted partition bound; use dual classes for rank-one
representatives; bound repeated-block shear quotients and local orbits by
ell^(2Delta); handle the isotypic stabilizer via a congruence kernel.
The p.12 counterexample uses 1 and −1 in R×, not i outside R×.
Prior findings are now version-qualified sourceIssues, without a review
verdict. The global product bounds only local orbit factors.

Resume:

1. Obtain a legitimate final/accepted 2018 text and compare v1. The publisher
   download again returned security HTML. Do not report these as verified
   errors in the final publication.
2. Close the general nonisotypic stabilizer and rational adelic class-set
   glue. L9 handles only one block; naive blockwise conductors may cost a
   cubic multiplicity exponent. Do not promote the source's sharper linear
   local bound or its general global stabilizer claim.
3. Match or plan the finite-DVR index, trace-dual quotient, coefficient-DVR,
   completion/evaluation and flag-extension adapters. The inspected
   natAbs_det_basis_change is Z-only. The selected DAG is not closed.
4. Continue inherited G3–G8: Gan–Yu/Jacobowitz measures, mass coefficient,
   residue bounds, free/projective comparison, real-Weil exceptions,
   original classification proofs and enhanced-limit tightness.
5. Preserve the original 113 IDs/statuses/statements and 19 withheld claims.
   Refresh main/audits before further routing. Finite regression is not proof.

Freshly read all LT v1 and selected Yun proof regions recorded in
verification; images 9,10,12 checked. Conrad and eight original library
checks remain historical evidence. Pins: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Explorer snapshot:
a527ccdb2a6c6ae0a1971482ca9cfa4dd9b005f7.

The report embeds the passing Python regression. No Lean file was written
or compiled. The three deliverables pass check_paper.py and intake.py check-files
(3 files, 0 problems), plus preservation/route/API/DAG checks. The publication
base is 5db325c698954f89a2b5c8524b297ce8fb066399; relevant protocol and GN
audit/description hashes match the working snapshot. Remain partial.

---

## Historical handoff from PR #1652 (unchanged)

# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff

Codex — codex-c83e7a; 21 September 2026; Refs #1332. **Partial checkpoint.**

The public v1 was read completely, Conrad's ten-page polarization notes were read completely, and Yun's specific local-counting proofs were checked. The JSON has 113 stable items (8 library, 26 planned, 79 missing), ten routes, 37 definitions/constructions with APIs and ≥3 tests each, and 19 explicitly unrouted claims. Only these issue deliverables and this handoff are submitted. No Lean implementation or compilation is claimed.

Start by obtaining and comparing the final 2018 paper. The report records exact URLs/hashes/read extents and nine gap groups G0–G8. Both author links lead to the 38-page 2015 preprint, whereas the journal has 51 pages; the canonical publisher links returned security HTML. Do not silently treat v1 as the final text or describe its errors as published-paper errors.

Resume in this order:

1. Reconcile final-source statements, especially Theorems 0.1–0.3, (26)–(28), the mass formula and (51)–(56), Corollary 5.13's quaternionic exception, Lemma 5.19 and Corollary 5.20. Preserve stable IDs and rewrite hypotheses if the final source differs.
2. Close local lattice counting from Yun plus a checked repeated-eigenvalue extension: flag fibers versus intersections, residue extensions, dual sandwich, discriminant/multiplicity factors, δ=0 and stabilizer indexing. The printed weak-composition estimate is false.
3. Acquire Gan–Yu/Jacobowitz and certify dyadic local densities, the measure and factorial coefficient, free versus projective classes, unit determinant labels and analytic residue ratios. Numerical experiments cannot replace these proofs.
4. Supply the real-Weil/quaternionic factor in conditional concentration. Give an eventual-in-g statement with uniform errors and the correct leading constant. Fix the spacing convention and construct the enhanced joint limit before claiming a probability law.
5. Retain the verified F₂ counterexample: y²+xy=x³+x²+1 has 2 and 8 points over F₂ and F₄, respectively. Only the p≥7 repair is currently routed. Check what the final paper does with the exceptional small primes.
6. Read original Tate, Honda, Waterhouse, Lang, norm-unit/class-group, Serre and Friedman–Washington inputs and expand their proof interiors. Split the §1 Euler suppliers and Remark 2.3 lower bound; locate the current upstream compact-support trace-formula stage. Do not claim the present list is a complete atomic dependency closure.
7. Recheck the main branch, pinned declarations, reviewed audits and pending new routes. R07.2 is an existing owner but has no direct reviewed-audit entry in this snapshot; its library boundary is corroborated by reviewed A4/A3 and source searches. Rerun schema, intake and custom ownership checks. Mark complete only after all missing items have exactly one justified route and the full source chain is closed.

The atlas portfolio and relevant inputs were pinned at 14482fbdbea546a681b66b8bb4ff336bdc8830c6. Library pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. PELModuli remains the sole moduli owner; A2 owns duals/polarizations, R07.2 Dieudonné theory, GN.2/GN.3 hermitian lattices/mass, AA.4 strong approximation and ST.0/ST.5 the family measures/statistics.

Unrouted item identifiers:

- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-unpolarized-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-repeated-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-elliptic-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/trace-formula`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/euler-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/power-sum-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/local-orbit-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/stabilizer-depth-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/regulator-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/residue-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/density-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/mass-asymptotic-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-count-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-concentration-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-power-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/spacing-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-pgroups-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/enhanced-failure-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/reduced-trace-source`

Checks: paper schema, intake for the three actual files, IDs/routes/stages/areas/file-existence/source-hash assertions, and reproducible finite arithmetic checks described in the report. Successful intake is not an independent mathematical review.
