# Verification: Schur–Weyl link-map finding

**Finding 1 confirmed, medium severity.** The missing ClassicalGroups Layer 0
→ SchurWeyl Layer 9 dependency should be added for the orthogonal inclusion,
restricted action and equivariant symmetric pairing.

Codex, session `codex-rtOQ9t`, 2026-09-30; issue #4373. Independent of the
red-team author `codex-J6LwjP`, link author `cgp-8384bdb1c668` and link reviewer
`codex-c83e7a`. Read the red-team result/report, the relevant accepted-review
decision, overlap 4, and both full endpoint descriptions. This verifies the
one reported finding; it is not a second complete red team of every Schur–Weyl
target. Input hashes are recorded in the review JSON.

## The pinned carrier settles the documentary conflict

Read [Mathlib `UnitaryGroup.lean`, orthogonal section](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/UnitaryGroup.lean#L284)
at the required commit. The section has `[CommRing R]` and installs
`starRingOfComm` as a local instance before defining `orthogonalGroup` through
`unitaryGroup`. The resulting definition captures that structure; it does not
take a caller-supplied `[StarRing R]` parameter. Read
[`starRingOfComm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Star/Basic.lean#L400)
as well: it is the trivial star operation.

The subsequent theorem `Matrix.mem_orthogonalGroup_iff'` states
`A ∈ Matrix.orthogonalGroup n R ↔ Aᵀ * A = 1`. It applies to `R=ℂ`
with ordinary transpose, not conjugate transpose. Thus the standing warning
in SchurWeyl Layer 9 is incorrect. The one-dimensional diagnostic separates
the two notions: multiplication by `i` preserves the Hermitian norm because
`conj(i)i=1`, but is not bilinear orthogonal because `i²=−1`.

For the standard bilinear pairing, the relevant mathematical compatibility is
direct: `(Ax)ᵀ(Ay)=xᵀ(AᵀA)y=xᵀy`. This identifies the form preserved by
the actual carrier. Packaging the restricted representation and the pairing
equivariance remains an interface supplied by ClassicalGroups; this check does
not assert that every such planned declaration is already implemented.
Changing to an arbitrary chosen nondegenerate form still needs its appropriate
basis/form comparison, rather than treating all forms as definitionally equal.

## The dependency and the correct fix

ClassicalGroups Layer 0, second bullet, explicitly owns the orthogonal
inclusion into GL, restricted standard representation, nondegenerate symmetric
form and equivariance of the pairing. SchurWeyl Layer 9's cap/cup construction
uses that form, and its double-centralizer bullet defines `orthAction` by
restriction along `O(V) ↪ GLₙ`. Both proposed endpoint quotations are exact
substrings of the full stage descriptions.

Overlap 4 correctly described a documentary conflict without claiming to have
checked the pinned declaration. The fresh source check resolves its orthogonal
side. Add the proposed inferred edge for that narrow contract, update the
overlap to name the pinned carrier and membership theorem, and record the
upstream warning correction for its maintainer. A replacement
`complexOrthogonalGroup` root is unnecessary. Do not rewrite the existing
upstream roadmap in this link-map fix.

The symplectic issue is independent. Read the pinned
[`Matrix.symplecticGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SymplecticGroup.lean#L98):
it is the matrix submonoid defined by `A J Aᵀ=J`. A separate exact integer
calculation with `J=[[0,1],[-1,0]]`, cap `J`, cup `J⁻¹` and unsigned tensor
flip `P` reproduces `E²=−2E`, `PE=EP=−E`. Hence resolving the orthogonal
carrier does not repair the symplectic Brauer crossing convention. Preserve
that obligation and all Brauer relations, invariant-theory surjectivity and
image-centralizer work. No full Brauer-relations check is claimed.

## Independent integration checks

The target link packet's SHA-256 matches the red-team snapshot. The pinned
UnitaryGroup and SymplecticGroup file hashes also match its recorded sources.
Searched all sibling research link packets: none already contains the proposed
pair. Ran the actual production assembler in memory, obtaining 2840 stages and
8007 edges. Both endpoints exist; neither a forward nor reverse path exists.

An in-memory diagnostic packet containing only the proposed edge passes
`merge_links` cycle validation, produces 8008 edges and adds the supplier to
the target's `requires`. Repeating the merge retains 8008 edges. The accepted
review marker used by this diagnostic is scratch-only data, not a modification
of the target packet or a submitted implementation. A scratch copy of the
whole packet with the proposed eleventh link passes `check_links.check` with
all other research link maps loaded: zero errors and warnings.

Validation of the submitted review: `check_redteam.py`, intake `check-files`
for the two deliverables and `git diff --check` pass. The original accepted
packet and generated atlas were not changed. No Lean file is required for this
verification, and no compilation or library build was attempted. Pinned-source
reads are statement/definition checks, not an exhaustive proof or axiom audit.
