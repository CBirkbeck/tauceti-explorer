# PAPER-XIE-YUAN-22 — geometric Bogomolov, source-routing checkpoint

Agent: **ChatGPT Pro — cg-6b83f1**. Refs #1270.

## Status and scope

**Partial checkpoint, not design-ready.** The accompanying packet contains 107 mathematical
items: three verified library carriers, eleven matches to existing atlas plans, and
93 missing statements or constructions, each assigned to exactly one of nine routes.
All numbered results of the inspected Xie–Yuan preprint are represented; several
multipart results are split. The partial status concerns genuine source and proof
boundaries, not an intention to omit the difficult parts of the paper.

The main unresolved points are the precise final-publication text, the field-of-specialness
argument in Proposition 3.6 of the public preprint, the interpretation of intersection
multiplicities in Proposition 2.1, and the original prerequisite proof interiors listed
below. This report supplies concrete tests and proposed repairs. It does **not** claim a
counterexample to geometric Bogomolov, that these passages remain in the journal edition,
or that the Lean libraries prove any new mathematics.

### Source and repository provenance

The paper is Junyi Xie and Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary
characteristics*, Inventiones mathematicae **229** (2022), 607–637,
DOI **10.1007/s00222-022-01112-1**. The publisher metadata agrees in title and authors.
The text read completely was **arXiv:2108.09722v1**, submitted 22 August 2021, whose
29-page title page is dated 24 August 2021. All sections, proofs and references were
read through the public PDF and its HTML rendering on 21 September 2026. The integral
ambient diagram and inequality on printed page 26 were also checked in a PDF screenshot.
The final 31-page journal text was not obtained for line-by-line concordance.

Public sources:

- Xie–Yuan: https://arxiv.org/html/2108.09722v1 and https://arxiv.org/pdf/2108.09722v1.
- Journal record: https://link.springer.com/article/10.1007/s00222-022-01112-1.
- Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*:
  https://arxiv.org/abs/math/0609387, particularly §4.
- Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*:
  https://math.stanford.edu/~conrad/papers/Kktrace.pdf, particularly Theorem 9.15.
- Yamaki, *Trace of abelian varieties over function fields and the geometric Bogomolov
  conjecture*: https://arxiv.org/abs/1405.0896, especially Proposition 2.3 and
  Theorem 1.5 = Theorem 5.5.
- Yamaki, *Strict supports of canonical measures and applications to the geometric
  Bogomolov conjecture*: https://arxiv.org/abs/1211.0406.

Direct source-byte downloads into scratch failed because the execution environment's
external network/DNS access failed. Consequently **no original-paper SHA-256 is claimed**.
The source URLs, versions and inspected sections are recorded in the packet. Obtaining
and hashing the exact source bytes, and comparing the final publication, are explicit
handoff obligations, not concealed by hashing a transcription instead.

The repository input is the successful Pages artifact at main commit
`aa74d637a0cb9d88e38aa8da265dcec2a8c87ee1`, run `35629187489`, artifact `10653926322`.
Its ZIP SHA-256 is
`176e2826e93f818f44299345e93a9ab26e0c78e17774457a1f8aa14e41ec78d4`.
The complete atlas, not just a keyword index, was available: 212 roadmaps and 1,968
stage records. No git commands were used and no atlas, source roadmap or other job's
file was changed.

Library pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit has blob
`5e708cfc74a51b10e62149113872fe4e00eb5846`. Worker rules and blueprint protocol have
blobs `1f059b38c76586ba09d3e309aad4c0bcc0a3e331` and
`638014814662c2db995c752579f0a419cf8c9431` respectively. Read the expansion protocol,
upstream guidance, the relevant upstream Jacobian document, and the EllipticCurves
and StableReduction documents already inspected in this session. The latter two were
checked to have unchanged blobs `e8d4cabfb37922b00a582aaf623102876c77f33e` and
`53c50f6e5c2ebbde46cac7720978afbf03212859`.

## 1. What is already supplied, and what is not

The three `library` items are deliberately narrow. Statements were opened at the
pinned Tau Ceti commit, not inferred from current documentation:

| Carrier | File and inspected lines | Exact boundary |
| --- | --- | --- |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `AbelianVariety/Basic.lean`, 50–145 | Proper geometrically integral group scheme over a field; smoothness and commutativity are proved. Not an abelian scheme, trace or polarization. |
| `AbelianVariety.IsIsogeny` and its characterization | `AbelianVariety/Isogeny.lean`, 35–110 | A group homomorphism whose underlying scheme morphism is finite and surjective. Not isogeny descent or a theorem of complete reducibility. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `LineBundle/Basic.lean`, 55–108 | Existing invertible-module carrier. Not a positivity, numerical-equivalence or canonical-height theory. |

Their blobs are recorded in the JSON. A further current-library search found the
elliptic `Point.canonicalHeight`; its actual pinned definition and hypotheses were read
in `EllipticCurve/CanonicalHeight.lean`, lines 10–135, blob
`5170baa0986531c63ac043ee22787f6edcb764f7`. This is a useful **near miss**, not the desired
subvariety-height construction. Its normalization is attached to `(O)`, half the
x-coordinate height attached to `2(O)`. It is not a replacement for heights of
positive-dimensional subvarieties, arbitrary-dimensional abelian varieties or the
quotient by the constant trace.

Search results are leads, not exhaustive absence proofs. The packet's remaining
status judgments also use the reviewed audit and the full supplier descriptions.
There is no fresh claim to have compiled or exhaustively re-audited all 70,000 Tau Ceti
declarations. The exact general statements are marked missing where only a special
case or a broad plan was found.

The most important scope checks are these. **RP.5** explicitly restricts its small-points
milestone to number fields and characteristic zero. **RP.0** is a point-height interface,
and **GZ.1** is the arithmetic height lane, not the geometric trace theory. The
Faltings-height roadmap **R35** concerns Hodge bundles, metrics and isogeny heights;
that is not canonical height of a subvariety. **TB.6** supplies local model metrics,
measures and approximation, but explicitly leaves equidistribution as a separate
global theorem. None of these scope distinctions can be removed by sharing the word
“height”.

## 2. Routing decisions

Every missing item appears once in a route. The seven source routes are refinements of
existing **proposed** roadmaps; none re-plans an immutable Tau Ceti roadmap.

| Route | Items | Owner and export |
| --- | ---: | --- |
| Non-proper intersections | 15 | `SchemeAndStackFoundations:SF.5`: effective rational Chow classes, proper components, dimension stratification, residual intersections and nef inequalities. |
| Embedded and linear descent | 5 | `SchemeAndStackFoundations:SF.0/SF.1`: descent across intersection fields, finite-dimensional reduction, gluing and the fibre-density argument. |
| Pencils and their geometry | 4 | `SchemeAndStackFoundations:SF.4`: Bertini, blowup incidence model, generic hypersurfaces and distinct constant fields. The associated height inequality has a different owner. |
| Isogeny fields | 6 | `AbelianSchemesAndArithmeticModuli:A6`: spreading, specialization and descent up to isogeny. |
| Abelian-scheme bundle theory | 15 | `AbelianSchemesAndArithmeticModuli:A1/A2/A3`: rigidification, torsion multisections, multiplication, nefness and numerical classes. |
| Good integral ambient models | 1 | `NeronModelsAndSemistableAbelianVarieties:R11.1/R11.3`: extend the abelian ambient diagram and identify its closures. |
| Torsion special sets | 3 | `HeightsRationalPointsAndObstructions:RP.5`: exact all-characteristic trivial-trace Manin–Mumford, torsion envelopes and prime-to-p density. |
| Function-field height extension | 22 | Proposed `FunctionFieldHeightsAndTrace`, a Part II of Heights, rational points and obstructions. |
| Geometric Bogomolov | 22 | Proposed `GeometricBogomolov`, a Part II of the same roadmap, importing the previous route and the existing owners. |

The two Part II briefs are in the JSON and are not instructions to start duplicate
design jobs immediately. The partial `PAPER-YUAN-26` packet already proposes adelic
line-bundle and uniform-Bogomolov extensions. Neither is an activated, verified supplier
at this snapshot. **Consolidate shared function-field heights and mixed intersections
with those routes before activation.** Yuan-specific uniformity, twice-theta choices
and Faltings-height bigness do not follow from this paper and are not silently imported.

The main proof-specific extension must give Yamaki's reductions actual stages.
Merely requesting local metrics from TB.6 would leave a large hole: maximal
nowhere-degeneracy, strict supports and the global argument still need their source
proofs. The geometry of torsion fibres then belongs to the Bogomolov extension, while
its intersection inequality and abelian-scheme bundles remain reusable exports.

## 3. Statement coverage and construction order

| Source | Packet coverage |
| --- | --- |
| §1 and Theorem 1.1 | Polarized function fields, models, canonical limits, dense small points, Chow trace, torsion and special subvarieties, both implications of the geometric statement. |
| Proposition 2.1 | Separate dimension and inequality items, with an explicit coefficient-convention problem. |
| Proposition 2.2 | Proper complete intersection and residual-cycle conclusion split; Nakayama/avoidance argument exposed. |
| Lemma 2.3, Proposition 2.4 | Positivity for globally generated divisors and domination of the proper intersection part. |
| Lemma 2.5 | Dimension bound and dominance of top-dimensional components split. |
| Proposition 3.1 | Two constant fields, independent of the subvariety, and the decrease of transcendence degree. |
| Proposition 3.2, Lemma 3.3 | Existence and uniqueness of isogeny descent separated from specialization of an isogeny. |
| Lemma 3.4 | Finite-dimensional linear descent, arbitrary vector spaces, and embedded closed-subvariety descent. |
| Corollary 3.5 | Separate minimal fields for an abelian isogeny class and for an embedded subvariety. |
| Proposition 3.6 | Source target retained and explicitly not certified by its printed argument. |
| Lemma 3.7 | Pencil geometry, generic-point identification, infinitely many fields, and the height inequality separated. |
| Lemma 4.1 | Symmetric and antisymmetric multiplication, torsion restriction, nefness and domination split. |
| Proposition 4.2 and §4.3 | Numerical torsion-multisection class and good-model realization of canonical height, with their normalization. |
| Theorem 5.1, Lemma 5.2 | Trivial-trace Manin–Mumford and one direction of the height/minimum comparison. The converse needed in the proof is a separate Gubler input. |
| Lemma 5.3 | Sum-image stabilization, quotient height argument and positive-dimensional strict-growth conclusion. |
| Proposition 5.4 | Smooth ambient map, good integral closures, prime-to-p proof, all-torsion source target and proposed finite-base-change bridge. |
| §5.3 | Dimension-zero case, smaller-dimensional fibres, density, Manin–Mumford and projection to X. |

The height lane begins with the polarization and the model intersection pairing, not
with an undefined real-valued predicate. The specialness lane first needs the universal
trace homomorphism and the existing torsion-coset/stabilizer APIs. Section 2's
intersection mathematics is independent of the advanced height comparisons. Section 4
uses abelian-scheme bundle theory and intersection degrees. In §5, the induction uses
both the zero-height criterion and the smaller fibre dimension; neither is an informal
consequence of the main theorem being proved.

The recorded item prerequisite graph is acyclic, but it is a **partial dependency
extraction**, not a closed blueprint. Missing edges to original source proofs remain
recorded as gaps. The checker passing does not establish mathematical closure.

## 4. Field-of-specialness diagnostics and a candidate bypass

### 4.1 The abelian field does not determine the field of a point

Here is an explicit diagnostic for the nonconstant branch in the proof of Proposition
3.6 of **arXiv v1**. Work in characteristic zero over an algebraically closed k. Let
F be an algebraic closure of k(t), and let

`E: v² = u(u−1)(u−t)`

be the Legendre elliptic curve over F. Its j-invariant is the nonconstant rational
function `256(1−t+t²)³/(t²(1−t)²)`, so E is not isogenous to a constant elliptic curve
over k: an isogeny to a fixed constant curve would force j to be algebraic over k
by the modular polynomial. Let Ω be an algebraic closure of F(E), and let P be the
generic point of E_F, viewed as an Ω-point. Set A=E_Ω and X={P}.

The connected stabilizer of X is zero. P is not torsion, because every torsion point of
E_F is F-rational whereas P is generic. Since an elliptic curve has no proper
positive-dimensional abelian subvariety, the minimum torsion coset containing X is A.
Thus both reductions made in the preprint's proof hold. The trace of A over k is not
all of A, so this is its nonconstant branch.

Nevertheless A already descends to F, and therefore its minimum isogeny field k_A is
contained in F. The point X is **not** special over F: on the constant E_F over the
algebraically closed field F, every zero-dimensional special subvariety is an F-rational
point; sums with torsion do not change this. P is not such a point. Consequently the
shortcut identifying the least field of specialness of the pair with k_A loses the
field of definition of X. This is a counterexample to that shortcut, not to Theorem 1.1.

### 4.2 The asserted intersection map on intermediate fields is not injective

There is also an elementary test for the opening poset reduction. Take
K=k(x,y), Ω an algebraic closure, z²=y, t=x+z and t′=x−z. Then t,t′ are algebraically
independent over k. Let F be the algebraic closure of k(t) inside Ω. An extension of
the K-automorphism z↦−z sends F to the algebraic closure F′ of k(t′).

One has F∩F′=k. Indeed, a nonconstant common element c would make both t and t′ algebraic
over k(c), contradicting their algebraic independence. Every element of F∩K is fixed
by the automorphism, hence also belongs to F′. Therefore F∩K=k, although F has
transcendence degree one. F and k have the same image under the claimed map
`I(Ω/k) → I(K/k)`, so it is not the asserted bijection.

No publication-level conclusion is drawn from these v1 tests. They tell the next worker
exactly which statements must be compared with the final source rather than accepted
as proof-complete inputs.

### 4.3 A route that may suffice for Proposition 3.1

The main reduction needs only the two distinct one-variable constant fields produced
by the pencils. Their algebraic closures are algebraically independent over k and
intersect in k. It need not use the general poset theorem of Proposition 3.6.

A candidate proof is as follows. Suppose X is special over both closed constant fields.
First quotient by the reduced connected stabilizer, and translate within the minimum
torsion coset. The specialness equivalences for these operations must be supplied as
lemmas, with the positive-characteristic group-scheme convention explicit. In the
resulting pair, connected stabilizer zero forces the abelian-subvariety part of either
special expression to vanish. Since the torsion envelope is the whole ambient variety,
the trace image over each field is then the whole ambient variety. Thus the ambient
abelian variety is constant up to isogeny over both fields.

For these algebraically independent one-variable fields, isogeny descent admits the
following finite-type specialization proof. Descend the two abelian varieties to
function fields of curves. By rigidity of Hom after algebraically closed extension,
an isogeny can be chosen over a finite extension of their compositum. Normalize an
open part of the product of the two curves in that extension and shrink until the
map is finite flat and the isogeny extends. A fibre above a k-point of the second curve
then dominates an open part of the first curve; specialization shows the first abelian
variety is isogenous to a constant one. Do the same for the second, and apply Lemma
3.3 for uniqueness. Algebraic independence matters here: intersection equal to k alone
in higher transcendence degree does not justify the product-dimensional argument.

Transport X through the resulting isogeny to one fixed constant abelian variety.
Hom rigidity implies that its abelian subvarieties descend to the closed constant
field; its torsion points do also. Being special over either of the two fields is
therefore embedded descent of this transported subvariety. Apply Lemma 3.4 to descend
it to their intersection k, and transport specialness back through the isogeny.

This is an **authored replacement proof outline** with identifiable prerequisites,
not a claim that the final journal paper follows it, that Proposition 3.6 has been
proved, or that the positive-characteristic quotient/descent lemmas have been formally
checked. Those are explicit acceptance obligations of the proposed route. The source
target Proposition 3.6 remains in the inventory, not deleted because the main theorem
might bypass it.

## 5. Intersection multiplicities: a six-versus-four test

The public proof of Proposition 2.1 invokes a passage from intersection multiplicity
to local length and mentions higher-Tor vanishing. Expected dimension alone does not
justify that passage. The following calculation shows why a blueprint must distinguish
**fibre lengths** from **Serre intersection coefficients**.

Let k have characteristic zero, put A=k[a,b] with a=x² and b=y², and take the integral
finite A-algebra

`R = k + (x,y)² ⊂ k[x,y]`.

Grouping monomials by parity gives an A-module decomposition

`R = A ⊕ Axy ⊕ (a,b)x ⊕ (a,b)y`.

In particular, its generic rank is four. In the fibre at (a,b)=(0,0), however, the six
monomials

`1, xy, x³, x²y, xy², y³`

form a k-basis of `R/(a,b)R`. The special fibre has length six. Each of the two copies
of the ideal (a,b) has the exact resolution

`0 → A → A² → (a,b) → 0`,

with maps given by the Koszul relation and the generators a,b. Consequently the
minimal resolution of R at the origin has ranks two and six. Its derived fibre has
Tor_0 dimension six and Tor_1 dimension two, with no higher terms; the Euler
characteristic is four, not six.

This fits the projective ambient setup as well. Homogenize by taking

`X = Proj k[z,x²,xy,y²,x³,x²y,xy²,y³]`

and

`Y = Proj k[z²,x²,y²] ≅ P²`.

The inclusion is finite: the middle ring is a submodule of the finite module
k[z,x,y] over the Noetherian bottom ring. Its affine chart over z²≠0 is the finite
cover just calculated. The projective function-field degree is four. Embed X into
some P^N using a sufficiently divisible Veronese and take its graph in
`B=Y×P^N`. Then B and Y are smooth projective, g:B→Y is flat, and f:X→Y is finite
and surjective. Here e=0 and the fibre-dimension jumping locus is empty. For the
point V=[1:0:0], the scheme fibre is the single length-six point.

If the m_i in Proposition 2.1 are interpreted as fibre lengths, its inequality would
imply `6 ≤ 4` after taking the degree of zero-cycles: the right-hand degree is four
by projection formula and `f_*[X]=4[Y]`. This is impossible. In contrast, the Serre
coefficient is four, so this diagnostic does not contradict a consistently
intersection-weighted formulation.

The monomial basis was independently enumerated in Python. The module decomposition,
Koszul exact sequence and projective realization above are mathematical arguments;
the enumeration does not certify them in Lean. This distinction is retained in the
handoff.

**Required repair work:** determine the final source's intended m_i, read Fulton
7.1(b), and formulate the inequality using the correct positive coefficients. The
height argument only needs positive coefficients on the relevant components; it does
not require them to be the lengths of the scheme fibre. A consistently Serre-weighted
version is thus a plausible way to repair the interface without assuming X is smooth
or Cohen–Macaulay. It still requires a proof, rather than changing the convention in
one display and leaving the other displays unchanged.

## 6. Height and abelian-scheme interfaces that cannot be suppressed

### Normalization and the missing converse

Write H(X) for the unnormalized canonical intersection height, d=dim X and
`D=deg_L X`. Xie–Yuan use `hhat(X)=H(X)/((d+1)D)`. The one-variable fundamental
inequality is

`H(X)/((d+1)D) ≤ μ_ess(X)`.

It proves that dense small points imply height zero, using nonnegativity. The induction
also needs **height zero implies dense small points**, which is not a logical
consequence of this inequality. Gubler's Proposition 4.3 gives

`Σ_(i=1)^(d+1) e_i(X) ≤ H(X)/D`.

For canonical nonnegative point heights this yields the converse, explicitly recorded
in Corollary 4.4; Yamaki's Proposition 2.3 also cites it. The source route includes
both inequalities. They are imported here only in the one-variable setting in which
the induction occurs, not silently generalized to arbitrary-dimensional polarized bases.

The zero-dimensional base needs the trace-corrected theorem. Conrad's Theorem 9.15
states positivity on the quotient by the image of the constant trace, after tensoring
with R, for a finitely generated regular extension with its polarization. With trivial
**geometric** trace, passing to a finite field of definition gives height zero iff
torsion for a geometric point. Ordinary Northcott finiteness over arbitrary algebraically
closed constants is not being asserted.

### Rigidification, nefness and numerical classes

A rigidification is a trivialization along the identity section, not simply fibrewise
triviality. The square/cube formulas give multiplication by m² for symmetric bundles
and by m for antisymmetric bundles. The identity

`2L = (L+[-1]*L) + (L-[-1]*L)`

does not permit division by two inside an integral Picard group. On an m-torsion
multisection, the formulas do show torsion restriction; `2m²` is a safe common
annihilator when combining the two parts.

A symmetric rigidified relatively ample bundle is nef on the total space, not in
general ample there: it has degree zero on the identity section. Proposition 4.2
assumes relative dimension g≥1, but does **not** require the bundle to be relatively
ample. Its conclusion is a numerical equality of one-cycles,

`L^g ≡ (deg(L_η)/deg(T/S)) [T]`.

Do not upgrade it to rational equivalence or assume the coefficient is positive for
an arbitrary symmetric rigidified bundle. Positivity is supplied separately by the
ample bundle used in §5. The proof against a rigidified test bundle splits the **test**
bundle into symmetric/antisymmetric parts; the v1 letter slip in that sentence does
not change which factor carries exponent m^i.

### Addition images, torsion orders and the nef calculation

The positive-dimensional branch of Lemma 5.3 must be stated explicitly. When X={0},
all sum-image dimensions are zero and the printed strict increase has no solution r.
That case has its own induction base in §5.3. For d>0 use

`Y = X_(r−1) × X`, `e=dim X_(r−1)+d−dim X_r < d`.

Here X_(r−1) is a sum image, not X raised to a Cartesian power. This distinction
is what makes the dimension induction work.

The proof printed for Proposition 5.4 uses a torsion multisection of order prime to
the characteristic; the statement quantifies over all torsion. There is a concrete
proposed bridge. After a finite extension making t rational, normalize the smooth
projective base curve. Over algebraically closed constants the resulting normal
curve is smooth. Pull back the good abelian models and extend t by properness to a
section, which is torsion by separatedness. That section is a smooth curve even if
its order is divisible by p. Apply the same intersection proof there, then use the
finite-extension normalization of heights to descend vanishing. This avoids the
false assertion that p-primary multisections are automatically étale. The proof's
normalization and closure compatibilities still have to be established. Alternatively,
prime-to-p torsion alone is dense enough for the main induction.

Finally, after the correct positive-coefficient intersection inequality, let
q=dim A′ and `[T]≡a L_A′^q`, a>0. The required chain is

`0 ≤ Σ m_i L_B^(e+1)[Z_i]`

`  ≤ a (h*L_A′)^q L_B^(e+1)[Y]`

`  ≤ a b^q L_B^dim(Y)[Y] = 0`.

There is one factor a after substituting the numerical class. The extra factor in
one intermediate v1 display should not be reproduced mechanically. The mixed-nef
bound follows by expanding

`(bL)^q−M^q = (bL−M) Σ_(j=0)^(q−1) (bL)^(q−1−j)M^j`.

The polynomial identity was checked symbolically for q=1,…,8. Positivity of every
mixed intersection is a separate theorem of the intersection owner. Positive m_i
then force the individual component heights to vanish. The Gubler converse is needed
before applying the lower-dimensional induction hypothesis.

## 7. Prerequisite proof ledger

The full Xie–Yuan v1 was inspected. For cited prerequisite papers, the following is
what was actually established in this run, not a claim to have read every reference
in its bibliography.

| Prerequisite | Inspected | Still required |
| --- | --- | --- |
| Gubler 2007 | §4 statements and proof, particularly 4.1, 4.3, 4.4 and their normalizations | The canonical metric/height construction and the referenced Zhang/Nakai–Moishezon proof leaves. |
| Conrad 2006 | Trace context and Theorem 9.15 with its hypotheses and reduction context | Full trace construction, base-change/isogeny API and proof of positive definiteness modulo trace. |
| Yamaki, trace paper | Proposition 2.3, Theorem 1.5 = 5.5, final reduction proof and its use of Theorem 5.3 | Relative-height and product-splitting proof interiors in §§3–5. |
| Yamaki, strict-support paper | Identified exact role of maximal nowhere-degenerate part and Theorem E | Full strict-support and global argument, rather than citing TB.6 as if it supplied them. |
| Gubler 2003 | Bibliographic identity and the theorem invoked by XY | Read Theorem 11.18 and the proof route for model-independent subvariety heights. |
| Hrushovski / Pink–Rössler | The exact trivial-trace theorem XY 5.1 consumes | Select and completely check the all-characteristic primary proof, including its model-theoretic or algebraic prerequisites. |
| Fulton / Jouanolou / Hartshorne | Invocation points and the exact intended intersection/pencil outputs | Original source locators, coefficient interpretation, generic-member normality and the finite-type spreading steps. |
| Lang | Which square/cube, seesaw and constant-plus-torsion statements are consumed | Original passages and compatibility with the existing A1–A3 design. |

References cited only as historical alternatives are not imported into the proof
merely because they appear in the introduction. Conversely, Yamaki and the positive-
characteristic Manin–Mumford input are indispensable unless a replacement proof is
specified. Their missing proof interiors cannot be replaced by a generic word such
as “equidistribution” or “reduction”.

## 8. Checks and resumption

Actually run:

```
python3 scripts/check_paper.py research/blueprint/papers/PAPER-XIE-YUAN-22.result.json
```

Result: **ok**. Additional scratch checks verified unique IDs, valid supplier stages,
correct source-roadmap ownership, exactly-once routing of all 93 missing items, and
acyclicity of the recorded local item dependencies. A coverage list checks that every
numbered result has an item. The monomial quotient basis, the nef telescoping polynomial,
the nonconstancy of the Legendre j-function and the elementary dimension/normalization
arithmetic were tested separately. None is a Lean proof or a certificate of the
uninspected cited mathematics.

Only this report, the JSON and the issue's handoff note are submitted. **Lean was not
run and no Lean file is required by this paper-routing issue.** The result remains
partial even if the intake checker accepts and merges the checkpoint. The independent
review must resolve G-SOURCE, G-FIELD, G-INTERSECTION, G-INPUTS, G-PENCIL and G-OWNERS
before marking the extraction complete or activating conflicting design briefs.

Resume from the retained item IDs rather than restarting. First obtain the matching
final source, then settle the two explicit diagnostics, then fill the prerequisite
proof ledger and reconcile the Yuan routes. The main theorem, the disputed source
targets and all imported API obligations remain visible throughout that process.
