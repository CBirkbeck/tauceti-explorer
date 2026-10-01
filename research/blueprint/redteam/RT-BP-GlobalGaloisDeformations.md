# RT-BP-GlobalGaloisDeformations

Issue #4446. Codex, session `codex-rtOQ9t`, 1 October 2026.

Complete adversarial audit: **three findings, two high and one medium**. None
asserts an error in the underlying conjugacy or Taylor–Wiles theorems with their
correct hypotheses. The defects are in the proposed signatures, the specified
complex, and the attempted common proof of two different source variants.

## Scope and independence

I did not author or review `BP-GlobalGaloisDeformations` or its original review.
I checked the current files at `a955b0a8690e48ce9817d6980087ec0710f5175a`, including
the later Langlands-area amendments, rather than treating the original 65-node
review as certification of the present 66-node packet.

Read: the campaign document; all 66 nodes' statements, hypotheses, proof steps,
prerequisites, APIs and tests; the 641-line reader and 441-line suggested file;
all 19 requests, coverage and the recorded gap; E1–E3; the two consumer contracts;
the original review and `REV-FIX-RT-AREA-langlands-1~2`; and the related findings
of the two Langlands-area audits. The latter already discuss the R01.4 supplier,
KW numbering and PA.3/PA.4 ownership. Findings below do not repeat those issues.

The source reading was selective, following the declarations and their proof
dependencies, not a new full extraction of every cited paper. Principal passages:

| Source | Passages read for this audit |
| --- | --- |
| [Gee, arXiv v2](https://arxiv.org/pdf/2202.05818v2) | Physical pp. 11–21, 38–39: coefficient categories, strict conjugacy, local conditions, the modified complex, presentations and prime selection. The complex on p. 16 was also checked visually. |
| [Kisin, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf) | All four pages, through the web PDF reader. The direct download returned 403; no independently verified file hash is claimed. |
| [Khare–Wintenberger II, author final](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Physical/printed pp. 6, 37, 41–45, 47–48, 79–81; §4 generator/relation proofs, §5.3–5.4, and the arithmetic export. Also the bibliography entry [59], p. 97. |
| [KW II, ESI 1892](https://www.esi.ac.at/preprints/esi1892.pdf) | Physical pp. 32–33 (printed 31–32), checking the older Lemmas 4.3/4.5 and Proposition 4.4 against the final numbering. |
| [Chenevier, arXiv v2](https://arxiv.org/pdf/0809.0415v2) | Physical pp. 34–35, 39–43: Theorem 2.22, the Cayley–Hamilton comparison and determinant deformation functors. |
| [BLGGT, arXiv v4](https://arxiv.org/pdf/1010.2561v4) | Physical pp. 15–17, including Lemma 1.2.3 and its finite-image/trace argument. |
| [CHT](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | Physical pp. 7–11, 20–25, 31–33: the polarized group, Schur condition, framed complex and presentation. |
| [ACC+, published](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Physical pp. 135–137, 144–145, 148–151 (printed pages +896): variable determinant, the relative tangent complex, enormous image and the auxiliary-prime proof. |
| [Calegari–Geraghty, published](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | Physical pp. 114–115, Proposition 8.5 and its proof; kept distinct from ACC+'s branch. |
| [Taylor, meromorphic continuation](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf) | Physical pp. 21–22, printed 749–750: Lemma 2.5 and its complete constituent-by-constituent detection argument. This is KW's reference [59]. |

Downloaded versions of the packet's nine accessible PDFs, including the historical
ACC+ v2, match their recorded SHA-256 values. Acquisition of a file is not a claim
to have read its unlisted pages. Taylor's additional 52-page published PDF has
SHA-256 `b789abe91b16eb592acf88c639a3af7b7c3192ad81b74a6d21ea10593df9cc9a`.
KW's public author PDF required disabling TLS certificate verification for that
download; its bytes matched the packet's pre-existing hash.

## 1. High: the suggested conjugacy theorems are false over their coefficient rings

**Where:** `suggested/GlobalGaloisDeformations.lean`, `strict_of_full` and
`strictly_conj_of_trace_eq`, corresponding to R04.1/strict-vs-full-conjugacy and
R04.2/carayol-trace-theorem.

The packet correctly works in the local coefficient categories. The signatures
instead quantify over a commutative ring A with a topology and a ring map to the
residual field. `strict_of_full` assumes surjectivity of that map but no local-ring
condition. The trace theorem does not even require surjectivity. The introductory
convention describing a residue map does not impose an additional Lean hypothesis.

Here is a counterexample satisfying even the stronger, surjective-map condition.
Give all rings and the finite group discrete topologies. Put A = Z, k = F₅,
π = reduction modulo 5, n = 2, and let ρ be the integral S₃ representation generated
by

```text
C = [0 -1; 1 -1],   S = [0 1; 1 0],
C³ = S² = 1,       SCS = C⁻¹.

a = [2 5; 5 12],   a⁻¹ = [-12 5; 5 -2],   det(a) = -1.
ρ′ = aρa⁻¹.
```

The image has six elements. Since a modulo 5 is 2I, both representations lift
the same residual representation. Their traces agree over Z.

The residual representation is Schur and satisfies the explicit matrix-span
hypothesis in `strictly_conj_of_trace_eq`. Indeed, the four matrices I, C, S, CS
have flattened determinant −3, nonzero modulo 5. This also proves absolute
irreducibility after any coefficient-field extension.

Nevertheless no strict conjugator exists. Commutation with S forces a matrix
to have the form `[x y; y x]`; commutation with C then forces y = 0. Consequently
the centralizer of ρ in GL₂(Z) is exactly {I, −I}. If b conjugates ρ to ρ′, then
a⁻¹b centralizes ρ, so b = ±a. Their reductions are 2I and 3I, neither I. This
contradicts both proposed conclusions.

The source proof in Gee Lemma 3.7, pp. 12–13, takes place in the category defined
in §3.1, and Kisin Theorem 1.4.1, pp. 3–4, is likewise local-Artinian. The scalar
needed to normalize a conjugator must lift to a unit. A surjective map Z → F₅
does not lift the unit 2 to a unit of Z. Reading the pinned Mathlib definition
of `IsLocalRing` confirms that locality is a separate predicate, not a consequence
of `CommRing` and a map to a field.

**Repair:** state both theorems on the imported R03.1 coefficient category, with
the actual residue map and its kernel identification, or supply precise equivalent
locality/completeness assumptions for each source theorem. Do not rebuild that
category in this packet. Add the S₃/Z example as a negative test explaining the
necessary hypothesis, and test the corrected normalization over an allowed
Artinian local coefficient ring. Preserve the packet's correctly scoped theorem.

## 2. High: the specified trace-zero cone loses the framing scalars

**Where:** R04.3/relative-tangent-space, its R02.5 request, and the corresponding
reader paragraph.

The statement defines its complex using ordinary global cochains
C•(G, ad⁰ρ̄). Its proof subsequently uses H⁰(G, ad ρ̄) and local H⁰(ad ρ̄), which
do not arise from that displayed construction. Gee §3.23, p. 16, explicitly
modifies degree zero:

```text
C₀⁰(G, ad⁰ρ̄) = C⁰(G, ad ρ̄),
C₀ⁱ(G, ad⁰ρ̄) = Cⁱ(G, ad⁰ρ̄) for i > 0.

C⁰loc = ⊕v∈T C⁰(Gv, ad ρ̄),
C¹loc = ⊕v∈T C¹(Gv, ad⁰ρ̄)
         ⊕ ⊕v∈S\T C¹(Gv, ad⁰ρ̄)/L̃v,
Cⁱloc = ⊕v∈S Cⁱ(Gv, ad⁰ρ̄) for i ≥ 2.

Cⁱrelative = C₀ⁱ ⊕ Cⁱ⁻¹loc,
d(φ, ψ) = (dφ, res φ - dψ).
```

Thus this is a specifically modified mapping fibre, with its shift and signs;
calling it a cone of ordinary ad⁰ cochains is not sufficient. The full matrices
in degree zero encode changes of framing even when the determinant is fixed.

**Discriminating example:** F = Q, p = 3, n = 1, S = T = {3,5}, ρ̄ = χ = 1,
and unrestricted local conditions subject to this fixed determinant. These
satisfy p > 2, p ∤ n and T containing the places over p. Every representation
lift is forced to be 1. A T-framed deformation is nevertheless a pair
(α₃,α₅) in (1 + m_A)² modulo simultaneous multiplication by 1 + m_A. The ratio
α₅/α₃ identifies the functor with 1 + m_A. Therefore Rloc = O, the framed global
ring is O[[X]], and its relative tangent dimension is **one**.

Here ad⁰ = 0. Ordinary trace-zero cochains give the zero complex and tangent
dimension zero. Even if “full local cochains” is interpreted as retaining local
ad in degree zero, leaving the global degree zero trace-zero would give two
framing directions instead of their one-dimensional diagonal quotient. Gee's
modified complex gives k²/diag(k), as required.

The packet already has the correct long exact sequence and the correct numerical
term #T − 1. Its E3 records the source's different H⁰/counting error; this finding
does **not** ask to rediscover E3. It asks to make the construction support the
corrected proof. The reader still prints #T, so in the example it gives two;
the existing E3 correction has not reached that paragraph.

The current R02.5 request says “with framings” but does not spell out the modified
degree-zero terms. Its supplier packet's R02.5 nodes specify ordinary Selmer
cardinality and comparison statements; SelmerIwasawaCohomology L2's current nodes
specify kernels and local conditions, not this exact framed complex. An open
request is legitimate, but it must state the object actually needed.

**Repair:** specify the displayed modified complex, differential and degree
convention, and request that exact interface from the existing cohomological
owners. Keep a separately named ordinary Selmer kernel for the dual conditions.
Retain the packet's corrected #T − 1 and propagate E3 into the reader. Add the
rank-one two-framing example, alongside T = ∅ and a single framing, as tests of
the complex and of its comparison with the deformation functor. Changing the
formula alone cannot fix an incorrectly specified complex.

## 3. Medium: the KW branch does not imply adjoint irreducibility

**Where:** R04.5/odd-taylor-wiles-primes, proof step 3, acceptance item 3 and the
Taylor reference in its hypotheses; the reader's common spanning argument.

The node offers the KW cyclotomic-absolute-irreducibility hypothesis and Gee's
stronger image hypothesis as alternatives. It then asserts that the nonzero
cocycle-image span is all of ad⁰ρ̄(1) by irreducibility. Its acceptance criterion
explicitly says that the image hypothesis provides this irreducibility.

That is true in Gee's argument under the stated SL₂ image condition; it is false
for the KW alternative. For a concrete arithmetic example, take p = 5 and the
splitting field K of X³ − 2 over Q. Its Galois group is S₃ (Eisenstein at 2,
discriminant −108), with quadratic subfield Q(√−3). Use the representation C,S
from finding 1 modulo 5, extended to F₂₅ if all residual eigenvalues are desired.
The matrix-span calculation proves absolute irreducibility. K ∩ Q(ζ₅) = Q:
an abelian quotient of S₃ is at most C₂, while the quadratic subfield of Q(ζ₅)
is Q(√5). Hence the cyclotomic restriction still has image S₃. Q is totally real
and unramified at 5; complex conjugation is a transposition with determinant −1.

But the three-dimensional trace-zero adjoint has the proper invariant line

```text
J = C - C⁻¹ = [1 -2; 2 -1],
CJC⁻¹ = J,     SJS⁻¹ = -J.
```

Tensoring with the cyclotomic character preserves that line. Thus even a totally
odd example satisfying the KW hypotheses refutes the claimed irreducibility.
This is a gap in the proposed proof, not a counterexample to KW prime existence.

KW II Lemma 5.3, pp. 47–48, uses Lemma 5.2(1) for the vanishing input and cites
Lemma 2.5 of bibliography entry **[59]** for the rest. That entry is Taylor's
*On the meromorphic continuation of degree two L-functions*, not *Remarks on a
conjecture of Fontaine and Mazur* (entry [58]), as the packet currently says.
Taylor's actual proof, printed p. 750, tests each irreducible constituent V of
the adjoint. It explicitly treats a nonzero complement of dimension one or two,
using the corresponding induced/dihedral description. No irreducibility of the
entire adjoint is assumed. Gee's p. 39, by contrast, explains that the whole
adjoint is irreducible because the image contains SL₂(F_p).

**Repair:** split the detecting-element proofs. Keep Gee's whole-adjoint span
under its strong image hypothesis. For KW, import the source-qualified
constituent-detection lemma from ArithmeticGaloisRepresentations R01.4, including
its dihedral cases and the applicable odd-p hypotheses; retain R02.6's separate
H¹ vanishing input. Supply any p = 3 branch through KW's indicated argument,
without silently extending Taylor's l > 3 assumptions. Correct the Taylor title,
version and locator. Both branches can then reuse the existing
`chebotarev-selmer-selection`. Add the above allowed dihedral example to the
image tests. Do not strengthen the KW theorem to exclude it.

## Library, ownership and graph checks

`data/library-coverage.json` still lists AUDIT-32 among pending imports and has no
GlobalGaloisDeformations entries. I therefore also read AUDIT-32's actual eight
layer entries and its accepted `REV-AUDIT-32`, rather than treating the aggregate's
absence as evidence that an audit was never done.

All 16 packet baseline declarations were opened at their recorded commits:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. They supply the stated ambient rings,
groups and low-degree cohomology, not any missing deformation theorem. In
particular GL is matrix units, its `map` is induced by the ring map,
`IsLocalRing` is separate, and Tau Ceti Z1/B1/H1 are the explicit continuous
cochain subquotients. Searches for Carayol, Schlessinger, Taylor–Wiles,
SelmerComplex and deformationFunctor found only Mathlib's FLT bibliography
reference, and no Tau Ceti match.

The relevant upstream contracts were read in ProfiniteCohomology (scope,
ownership and exported interface), ClassFieldTheory Layer 12 and Chebotarev
(scope, conventions and Layer 10). The proposed fixes preserve their ownership:
R03.1 supplies coefficient categories; R02.5/D8 and the Selmer owner supply
cohomological constructions; R01.4 supplies finite-image arguments; Chebotarev
supplies density. No new standalone Galois-cohomology or density theory is
requested. The generic selector and the PA.3/PA.4 consumer contracts added in
the previous fixes are retained.

The assembled registered stage graph is acyclic: 2,907 stages, 8,246 edges with
registered endpoints; 76 proxy-endpoint edges were counted separately. The
packet's internal graph is acyclic on all 66 declarations. Its already recorded
R04.2 → R04.1 stage-coarsening obstruction remains a legitimate gap, not a new
finding here. This is not certification that all 19 open requests are fulfilled.

## Validation

- Exhaustive finite/integer checks: six-element matrix group, integral conjugacy
  and traces, all 625 possible mod-5 centralizing matrices, matrix-span determinant
  −3, the adjoint sign line, and the three orbits of F₃² under diagonal F₃.
- `check_blueprint.py` on the unchanged target: 66 nodes, 0 errors, 0 packet
  warnings. The tool reported no local declaration index; direct pinned-source
  reads above supplied the baseline verification.
- `check_redteam.py`, the two-file intake check and `git diff --cached --check`.
- No Lean elaboration: this job changes only audit JSON and Markdown, and no
  compiled build at both pins was established. No Lake setup, cache acquisition,
  library build or language server was started.

The findings are ready for independent verification. These deliverables propose
repairs; they do not modify or certify implementation of the target roadmap.
