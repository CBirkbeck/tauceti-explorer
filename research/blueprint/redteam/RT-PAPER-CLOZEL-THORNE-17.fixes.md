# Fixes: Clozel–Thorne III extraction

Codex, session `codex-rtOQ9t`, 2026-10-01. Refs #5516.
All five findings in `RT-PAPER-CLOZEL-THORNE-17.review.json` are confirmed.
This submission applies them to the extraction and reader. It changes no
independent review file, campaign file, atlas data or upstream roadmap.
Independent fix review remains required.

## 1. Integral versus braid-group presentation

Item 006 now states the integral presentation with **positive braid monoid**
generators and the corrected relation

\[
(T_s-q)(T_s+1)=0.
\]

These generators satisfy braid relations without being required to have
inverses. The presentation sends the positive lift of a reduced word for
$w$ to the existing double-coset basis element $[BwB]$. The source's cited
Matsumoto theorem remains the blueprint's proof input; this bounded fix
reading does not claim a fresh full supplier audit of that theorem.

The obstruction to the former statement is direct. A group-algebra generator
is a unit. The integral double-coset degree character sends $[BsB]$ to the
integer $q>1$, a nonunit. A unital ring homomorphism takes units to units,
so no generator-preserving integral braid-group presentation can hold.
Already $\mathbf Z[T]/((T-q)(T+1))$ has the character $T\mapsto q$.
This argument does not assert that adjoining an inverse to $T$ by itself
forces $q$ to be a unit in every quotient.

After scalar extension to a commutative ring in which $q$ is a unit,

\[
T_s^{-1}=q^{-1}(T_s-(q-1)),
\]

as multiplication and the quadratic relation verify. The braid-group
presentation is then valid. This includes $\mathbf Z[1/q]$ and the paper's
$\mathcal O$ with residue characteristic $\ell\ne p$.

New **E24** records the coefficient error in the **accessed accepted
manuscript**, pp.6–7. It is distinct from E6's quadratic-sign misprint.
It is not attributed to the unexamined Duke printing. The application's
$\ell$-adic coefficient regime is preserved.

The construction reuses Tau Ceti's existing double-coset ring and degree
homomorphism. At pinned commit `f790474`, I read
`TauCeti/NumberTheory/HeckeRing/Degree.lean`: `LeftCosetModule.deg` is a
unital ring homomorphism and `deg_single` sends a coefficient-weighted
basis coset to its degree times that coefficient. I used `git show` at
this pin rather than relying on the shared checkout's changing HEAD.
No new library classification is made for the composite presentation.

## 2. Rational local duality and coefficient-sensitive averaging

Item 065 now gives the perfect **$K$-valued** pairing

\[
Y_K^B\times Y_K^B\longrightarrow K,
\qquad \langle tx,y\rangle=\langle x,\jmath(t)y\rangle.
\]

The localized $K$-space for the contragredient residue character is the
annihilator of the other occurring localized spaces. The source's
anti-involution and rational projector identify the annihilator of
$Y_K^P$ with $(1-e_P)Y_K^B$. Neither this statement nor rational self-duality
provides a perfect pairing on a specified integral lattice.

This is also visible from a simple lattice test: a pairing with Gram matrix
$\ell I$ is perfect after extending to $K$, while its map from the original
$\mathcal O$-lattice to its integral dual is not surjective. This test
illustrates the failed implication; it is not an assertion about a specific
Gram matrix of the paper's $Y$.

Item 064 keeps the integral anti-involution, Bernstein subalgebra and
localizations, retaining $\ell\ne p$ and a chosen square root of $q$.
It states the projector separately over $\mathbf C/K$, or in an applicable
smooth averaging regime with $q+1$ invertible:

\[
e_P=(1+T_s)/(q+1).
\]

In the free rank-two integral Hecke algebra, its two coordinates are
$1/(q+1)$, so it fails to preserve the regular lattice when $q+1$ is a
nonunit. The rational identity $e_P^2=e_P$ follows from the quadratic
relation. At the level-raising prime $q\equiv-1\pmod\ell$, it is not an
integral Hecke element.

Remark 2.7 makes the distinction particularly explicit: the displayed
matrices define $Y_K^B$ without the primitive-root assumption, while that
assumption is needed for the specified $Y_{\mathcal O}^B$ lattice in
Proposition 2.6. For $\ell=5,7$, the residue class $-1$ has order two,
whereas a primitive root has order $\ell-1$.

Route 4 and the reader now import **Proposition 4.3, item 033**, for the
independently proved perfect **integral global** pairing used in the
level-raising argument. Its sufficiently-small-level finite double-coset
function space is distinct from the local rational pairing. No new source
issue is added for these extraction errors.

## 3. Retract E22 and verify the existing hypotheses

Item 049's theorem statement is unchanged. Its note and route 4 now verify
Theorem 5.7(4) using Theorem 6.2's existing hypothesis (3).

The primitive-root condition implies $u_0\nmid\ell$. Arithmetic Frobenius
at $u_0$ acts on $\mu_\ell$ by the primitive residue $q_{u_0}$, so the
cyclotomic image contains an element of order $\ell-1$ and is the whole
$(\mathbf Z/\ell)^\times$. Thus

\[
[F(\zeta_\ell):F]=\ell-1=4\text{ or }6.
\]

The Dickson reduction already used by the extraction gives a projective
image $\operatorname{PSL}_2$ or $\operatorname{PGL}_2$ over a finite field
of more than $\ell$ elements. Its abelianization has order at most two.
It therefore cannot have this cyclotomic extension as a subextension.
Scalars in the original two-dimensional representation act on both
summands of the residual symmetric power by the same scalar
$\lambda^{\ell+1}$; hence the field of its adjoint representation is a
**subfield** of the original projective field. Equality of the two
projective kernels is unnecessary.

The auxiliary-field step keeps the full joint image. Let $L/F$ be the
finite Galois extension containing both residual and cyclotomic fields
chosen on p.45. The auxiliary compositum $E_0$ is soluble and $S$-split;
its Galois closure $M/F$ remains soluble and $S$-split. If $L\cap M\ne F$,
the nontrivial finite soluble group of this Galois intersection has a
simple quotient. The corresponding simple Galois subextension of $L/F$
is split at every place in $S$, contradicting the way $S$ detects every
such subextension. Therefore $L\cap M=F$. Restriction to $E_0$ preserves
the joint projective/cyclotomic image and cyclotomic degree, giving
Theorem 5.7(4) over the actual auxiliary field.

**E22 is removed from active `sourceIssues`**, with the entire original
record, including its original independent verdict, preserved under
`resolvedSourceObservations` as a retracted audit observation. The report
explains why the verified red-team finding supersedes the earlier E22
conclusion. The independent review file remains unchanged. No extra
hypothesis is added to Theorem 6.2. With new E24 there are still **23 active
source issues**; E22 is a separate historical record.

## 4. Put the unipotent restriction in Lemma 5.3

Item 040 now explicitly retains the standing §5.1 hypotheses and requires,
at each $v\in R_0$, one of $R_v^1$, $R_v^{\mathrm{St}}$ or $R_v^{\mathbf m}$,
with the standing local conditions $v\nmid\ell$, $q_v\equiv1\pmod\ell$.
The dimension bound and finiteness conclusion are stated with this
restriction. The unrestricted printed target is retained in `sourceTarget`.
Route 4 and the reader use the corrected theorem contract.

The source's auxiliary constituent problems impose $R_v^1$. A nontrivial
character condition $R_v^{\chi_v}$ may prescribe inertial eigencharacters
which reduce to the trivial character but are not themselves trivial;
its constituents need not have unipotent inertial characteristic polynomial.
That extension needs its own character/twisting proof before being advertised.
E21 remains the active source locator, unchanged. The sole application on
p.43 has $R_0=\varnothing$, so its hypotheses are preserved.

## 5. One common Iwahori supplier

Items **006 and 008 move from route 6 to source route 2**, with their
`missing` classification unchanged. They contribute to the shared concrete
Iwahori presentation/coefficient interface at
`SmoothRepresentationsOfLocalGroups:SR.1/SR.4`. This agrees with the current
Kisin–Pappas routes 10–11 and Venkatesh item 29.

Route 6 keeps **013 and 063**, the additional Kazhdan–Lusztig classification
and standard modules. Its existing generic affine-Hecke and parahoric-centre
extensions import the concrete interface. Route 4 imports presentations from
route 2 and classification from route 6. No base-SR dependency on downstream
classification/parahoric-centre construction is introduced, and the abstract
Tau Ceti Hecke carrier is not replanned.

The coefficient-specialization contract is explicit. Base SR exports the
concrete coefficient-extension API; the downstream generic affine-Hecke
owner proves the generic-to-concrete bridge, so SR does not import that
downstream generic algebra. Compare the generic
presentation with concrete convolution by $v\mapsto q^{1/2}$, preserving
the basis, Bernstein subalgebra and Jacquet-exponent action; require $q$
invertible and a chosen square root where used. Distinguish the positive
integral presentation from this normalized form. Match Kisin–Pappas's
unramified relative/Frobenius data separately from the paper's ramified
unitary/split symplectic case. Venkatesh's split modular $q=1$ instance has
its own $S=\mathbf Z/\ell^r$, $q\equiv1\pmod{\ell^r}$,
$\ell\nmid|W|$ and averaging-volume conditions; it is not proof of arbitrary
coefficient regimes.

I read the current assembled SR.1/SR.4 descriptions at base `9e4d831`:
SR.1 requires invertible volumes for averaging and imports the abstract
Hecke carrier; SR.4 retains coefficient and $q$-half normalization hypotheses.
Neither has a matching reviewed entry in `data/library-coverage.json` at
this snapshot. I read Kisin–Pappas routes 10–11 and Venkatesh item 29.
The full concrete presentation remains **missing source work**. No finished
SR or candidate blueprint packet was found in this checkout, so the precise
contracts go into these extraction design/source briefs for their owners;
no unauthorized campaign/data/packet edits are made. The maintainer/design
jobs should carry this shared interface into the owners' blueprint.

## Source versions and correction checks

Downloaded the actual 53-page
[Cambridge accepted manuscript](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download)
on 2026-10-01, SHA-256
`fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742`.
The hash matches the earlier extraction/red-team copy. Reread
pp.6–8,12,17–18,35–36,39–46; inspected images 7,18,45.
This is a **bounded fix reading**, not a new complete article reading or
an audit of all external supplier proofs.

[Crossref's DOI metadata](https://api.crossref.org/works/10.1215/00127094-3714971)
has no update-to entry and an empty relation object. DOI browsing failed,
and Crossref's Project Euclid version-of-record download returned HTTP 200
`text/html`, not a PDF. The journal printing could not be compared.
A bounded exact-title erratum/correction search found no applicable correction.
Author-page fetches failed; the search engine's indexed author listing was
only a lead. These checks do not establish absence of a correction. No author
was contacted. E24 explicitly records these limits and the accessed version.

## Validation

- Paper checker and intake checks on the three deliverables: passed.
- Source-issue and source-version schema checks: passed.
- 81 IDs, 17 planned/64 missing, all classifications and supplier fields preserved; all 64 missing items routed exactly once; only 006/008 change route.
- All 22 remaining previous active source records are unchanged; the complete original E22 record and independent verdict are preserved in the retracted observation; independent review files are unchanged.
- Exact rank-one algebra calculations verify the quadratic relation, degree character, inverse after inverting q, q=1 specialization, projector idempotence and nonintegral coordinates at q≡−1. A lattice calculation distinguishes rational from integral perfect duality. Primitive-root orders at l=5,7 verify the cyclotomic-degree arithmetic.
- `git diff --check`: passed.

No Lean artifact is required or compiled. No library build, cache download,
Lake project or language server was started. The checks support the repaired
extraction contracts, not a claim that the missing supplier mathematics is
formalized or that every source issue has been independently re-audited.
