# BP-HabiroCyclotomicCompletions--HC.4 — completed pass

Issue #6470. Agent: Codex, session `codex-CrXH74`. The bot confirmed the claim
comment on 2026-10-05. This pass changes only the three HC.4 deliverables and
this handoff. The accepted parent packet is unchanged.

## Result and scope

The packet is complete and its sole stage, `HabiroCyclotomicCompletions:HC.4`,
is closed in the chosen scope. It has 36 new nodes: 4 definitions, 4
constructions, 2 comparisons, 19 lemmas, 5 theorems and 2 applications. There
are 40 API items, 25 unit tests, six planets and 32 pinned baseline references.
All implementation statuses are unchecked. There are no gaps, remaining
refinements or cross-roadmap requests.

The fifteen parent HC.4 targets are imported through `inheritedTargets`, using
exact parent identifiers. New work covers GSWZ §5.1: universal cyclotomic
coefficient algebras, both filtrations and graded pieces, leading factors,
finite/joint injectivity, rational reconstruction, the integer Taylor matrix,
determinants, signed adjugates, finite/global image congruences, scalar and
Taylor local detection, and Examples 5.6–5.7. The finite-domain embedding and
scalar-adic separation-transfer lemmas close the parent's non-Noetherian
coefficient-extension boundary in the rootwise theorem.

The explicit scope decision retains the parent's irreducibility-qualified
Theorem 6.2. The broader individual-root theorem over arbitrary subrings of
the algebraic numbers is not added: the parent identified a proof boundary and
no atlas consumer needs this generality. This is recorded in the rescope
proposal, not silently represented as a proved theorem. The parent file's
historical gaps are not edited by this part.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.4.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HabiroCyclotomicCompletions--HC.4.lean`:
  exit 0 against the shared prebuilt Mathlib at
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The only warnings are declarations
  using proof placeholders. The file imports individual Mathlib modules;
  it needs no additional Tau Ceti module. No language server or library build
  was started. Available memory was checked before every elaboration.
- Correspondence audit: all 40 API names have declarations and all 25 tests
  have named example docstrings. Every inherited supplier identifier in the
  reader was checked against the parent packet. No implementation claim,
  private path, source PDF or extracted source text is included.
- Exact symbolic arithmetic independently constructed M_N from the prescribed
  polynomial expansions and cyclotomic remainders for N=2 through 8. Its
  determinant agrees with the product over weights n<N in every case. It
  reproduced the displayed M_5, the Kontsevich vector, the modified vector's
  rational inverse, and both projector digit lists. This is arithmetic
  validation of the plan; the declaration sketches are not proofs.
- `git diff --check`: passed.

To reproduce the arithmetic, enumerate columns (n,k) by n ascending then k,
1≤n<N, k<n. Enumerate rows (m,l,j) by weight ml ascending, m descending within
each weight, then j ascending. For each entry, expand q^k P_(n−1) at
q=z(1−u), extract u^(l−1), reduce that coefficient modulo Phi_m(z), and
extract z^j. Compute integer determinants, and compare with the product of
D_1(n)D_2(n) for 1≤n<N. The first determinant values at N=1 through 6 are
1, 1, 4, 216, 1327104, 99532800000. The reader gives the example vectors and
the explicit M_3 and signed adjugate, so none of the scratch files is needed
for review.

## Sources and boundaries for the reviewer

Public sources, access date 2026-10-05, edition identifiers and PDF SHA-256
fingerprints are in the packet. GSWZ arXiv v2 §1.3–1.4 and §5.1 were read,
along with §5.2 for ownership and Examples 5.6–5.7. The rendered matrix and
determinant page was checked against the text extraction. The Wheeler author
copy was checked for the same formulas. Habiro's published Theorem 5.2 proof,
Theorem 6.2 proof and §7.5 were read for the coefficient transfer and scope
boundary. No source required for the chosen scope is missing.

Five new source issues, E19–E23, concern arXiv v2. Review especially the
Proposition 5.1 precision shift and the failure of its uncompleted infinite
tensor-product assertions. The determinant shift is witnessed already by
M_3 with determinant 4, whereas the printed product through weight 3 gives
216. The universal coefficient algebra is essential: an embedded R[zeta]
can lose cyclotomic factors when R contains roots. The finite-domain transfer
argument deliberately uses that embedded domain for rootwise rigidity,
separately from the universal Taylor coefficient algebra.

The baseline primitive-root product theorem already exists for domains. The
new node only transports it to universal coefficient quotients over arbitrary
rings; it does not re-plan the domain identity. Rank assertions assume a
nontrivial coefficient ring. Injectivity and the integral image criterion
require Z-torsion-freeness, while the construction and filtration statements
allow arbitrary commutative rings. Rational reconstruction is for H_(R) over
a Q-algebra, not the uncompleted tensor product H_Z tensor Q.

HB.6 owns Frobenius gluing and the number-field ring. HC.5 owns the
prime-inversion component decomposition used by the idempotent example.
Existing links and the reviewed HC.4 audit were screened before planning;
no supplier object is duplicated. AdicSpaces and LocalFieldsRamification
were the two upstream documents read for style and library vocabulary.

## Assembly and follow-up

No mathematical follow-up is required in the chosen HC.4 scope. Independent
review must check the new packet; this worker does not review it. Assembly
should retain the parent imports, plug the two finite-domain lemmas into the
rootwise proof, and apply the recorded scope clarification. The packet also
proposes the display split HC.4a (fifteen inherited classical declarations
plus two separation-transfer lemmas; five parent planets) and HC.4b
(thirty-four integral-comparison declarations; six new planets), so the
combined display does not exceed six planets per layer. The maintainer owns
that atlas restructuring. No data, content or parent packet was changed.
