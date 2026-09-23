# Errata record: Česnavičius, quasi-split unramified Grothendieck–Serre

Job **ERRATA-PAPER-CESNAVICIUS-22**, issue #1862. Codex, session
`codex-7e92bd`, 23 September 2026. This records the seven findings in the
[earlier extraction](../papers/PAPER-CESNAVICIUS-22.result.json) and
[report](../papers/PAPER-CESNAVICIUS-22.md), without changing those files. It adds one bibliography misprint (E8)
encountered while checking the published version.
The [companion JSON](PAPER-CESNAVICIUS-22.json) preserves their IDs and quoted
passages, supplies corrections and search records, and records source hashes.
No independent-review verdict is supplied.

The earlier extraction and report were read, including the 150 mathematical
items, proof notes, definition APIs, gaps and source findings. The source
passages implicated by the findings were checked again. This is not a fresh
line-by-line extraction of every supporting paper. Unread supplier proofs,
unchecked Lean APIs and unfinished roadmap coverage are not themselves errors
in the published sources.

| Finding | Place | Kind and reach | Existing correction |
| --- | --- | --- | --- |
| E1 | Lemma 6.3 proof | Error in the proof over imperfect residue fields | Main paper, arXiv v7 footnote |
| E2 | Gille 2002, Lemma 3.12, used in 8.4(1) | Gap in a cited proof | Gille's 2005 published erratum |
| E3 | Gille 2009, Lemma 4.5, used in 8.4(2) | Gap and incorrect supporting reference | Gille's May 2026 errata |
| E4 | Proposition 8.4(2) | Gap in passing from local to semilocal parabolics | Author's later survey footnotes |
| E5 | Last sentence of 8.4 proof | Missing residue-field subscript; mathematics unaffected | None located |
| E6 | Theorem 9.5 proof | `Out` instead of `Aut`; mathematics unaffected | None located |
| E7 | First sentence of Corollary 9.6 proof | False assertion about arbitrary inner forms; pure twists suffice | None located |
| E8 | Published bibliography [BFFP20] | Missing digit in arXiv identifier; mathematics unaffected | Correct in author/arXiv copy |

Thus four of the earlier findings already have corrections, and the added
bibliography misprint is already correct in the author/arXiv copy. The earlier summary's count of
three known and four new does not agree with its own E4 entry: that entry
already identifies the author's later correction. Here `known: new` for E5–E7
means that the searches below found no existing correction; it is not a claim
of priority or an independent review verdict.

## Versions and correction search

The main source is [Česnavičius, *Forum of Mathematics, Pi* 10 (2022),
e9](https://doi.org/10.1017/fmp.2022.5). Its
[published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9D047724E9541FA2BD7FE06FB9333B24/S2050508622000051a.pdf)
has 30 pages. The [current author copy](https://webusers.imj-prg.fr/~kestutis.cesnavicius/split-unramified.pdf)
and [arXiv v7](https://arxiv.org/pdf/2009.05299v7) have 32 pages but do not
always have identical page breaks. In particular E5 is on author p.25 and
arXiv v7 p.26. E1, E4, E6 and E7 are on published pp.18, 24, 26 and 27,
respectively. All locators below refer to printed page numbers unless a PDF
page is explicitly specified.

On 23 September 2026 the [arXiv main-paper listing](https://arxiv.org/abs/2009.05299)
showed v7, dated 8 November 2022, as the latest version and identified the
post-publication footnote on p.20. The current author PDF is byte-identical
to the old Paris-Saclay copy read by the extraction. The
[author's publication page](https://webusers.imj-prg.fr/~kestutis.cesnavicius/)
links both this paper and the later torsor survey.

The [survey listing](https://arxiv.org/abs/2201.06424) showed v4, dated
5 May 2025, as latest. Its E4 correction is on p.26. In the
[current 61-page author survey](https://webusers.imj-prg.fr/~kestutis.cesnavicius/torsors-regular.pdf)
it spans pp.24–25. The post-publication footnotes in this author copy were
located and read at pp.9, 10, 24–25, 36 and 39; none corrects E5–E7.

The Cambridge article page, journal all-issues index and targeted searches
within the journal for the author's name or paper title together with
“erratum” or “corrigendum” yielded no separate correction for this paper.
The [Crossref record](https://api.crossref.org/works/10.1017/fmp.2022.5)
had no `update-to` or `updated-by` fields and an empty `relation` object.
These are bounded negative searches, not a guarantee that no correction
exists. The exact queries and URLs are retained in each relevant JSON entry.

For E2 and E3, [Gille's publication list](https://math.univ-lyon1.fr/~gille/publis-an.html),
the original passages, the 2005 erratum and the May 2026 errata were checked.
The JSON records URLs, retrieval date, SHA-256 and reading boundaries for all
nine downloaded source copies. The publisher PDF has a dated download footer,
so its byte hash is specific to the retrieved copy.

## E1 — the Cohen isomorphism need not preserve the base field

**Locator:** Lemma 6.3 proof, published p.18; author and arXiv v7 p.20.
The source identifies the first-order thickening of a closed smooth-curve
point with `Spec(k_z[u_z]/(u_z²))` by Cohen structure theory and then uses
that identification to construct a morphism over the residue field `k_m`.
The problem is base-field compatibility, not the abstract coefficient-field
statement.

Take `k = F_p(s)`, `C = A¹_k`, `z = V(t^p − s)` and
`u = t^p − s`. The thickening has ring

`A = k[t]/((t^p − s)²)`.

It cannot receive a `k`-algebra map from `k_z = k(s^(1/p))`. Such a map would
give an element whose p-th power is `s`. Every p-th power in `A` belongs to
`k^p[t^p] = k^p[s+u]`, so it has the form `h(s+u)` for a polynomial
`h` with coefficients in `k^p = F_p(s^p)`. If `h(s+u) = s`, reduction
modulo `u` gives `h(s) = s`. Differentiate this equality in `F_p(s)`:
coefficients in `F_p(s^p)` have derivative zero, hence `h′(s) = 1`.
But `u² = 0` gives `h(s+u) = h(s) + h′(s)u = s+u`, a contradiction.
Here `u` is nonzero in `A`.

For perfect `k_m`, the residue extension is separable and the original
base-linear construction works. For imperfect `k_m`, which is necessarily
infinite, use the geometric presentation theorem CTHK97, Theorem 3.1.1,
to embed each first-order thickening into `A¹_{k_m}`. Translate the finitely
many images to make them disjoint. This supplies the map the proof needs.

**Known correction:** the author's post-publication footnote in
[arXiv v7](https://arxiv.org/pdf/2009.05299v7), p.20, attributes the observation
to Gabber and gives this repair. The published copy lacks it. The proof needs
the repair; the statement of Lemma 6.3 and the main theorem remain unchanged.

## E2 — a generic twisted parabolic needs descent of its type

**Locator:** [Gille, *Torseurs sur la droite affine*](https://math.univ-lyon1.fr/~gille/publis/affine.pdf),
Lemme 3.12, p.239 (PDF p.9); cited in CES22, 8.4(1), author p.25,
published p.23. The original page was read as an image because its text layer
is garbled.

The original proof passes from isotropy of the generic twisted class to a
parabolic `Q` defined over `k` in the original group. Isotropy directly
supplies a parabolic of the twisted group over `k(t)`; it does not by itself
supply the asserted `k`-parabolic.

Let `E` be the torsor on `P¹_k`, normalized to be trivial at infinity, and
let `I` be the type of a minimal parabolic of its generic inner form. The
scheme `E(X_I)` of parabolics of this type is proper over the regular curve
`P¹_k` and has a generic section. The valuative criterion extends that section
across the closed points. At infinity the torsor is trivial, so the section
specializes to a `k`-point of `X_I`. Consequently the original group has a
`k`-parabolic of the required type. The rest of the reduction can proceed.

**Known correction:** [Gille's 2005 erratum](https://math.univ-lyon1.fr/~gille/publis/erratum05.pdf),
*Transformation Groups* 10, 267–269, specifically pp.268–269. All three pages
were read. CES22 itself already says to consult Gil05 at this use, so this
is a corrected cited-source gap, not an overlooked new gap in CES22. The
lemma's statement is unchanged. The other correction in the 2005 erratum,
to Proposition 2.3, is not an additional finding in this extraction's use of
Lemma 3.12.

## E3 — establish generic anisotropy before using integral-point rigidity

**Locator:** [Gille, *Le problème de Kneser–Tits*](https://numdam.org/item/AST_2009__326__39_0.pdf),
Lemme 4.5(1), p.54 (PDF p.17), with hypotheses on p.53. The errata calls
this “page 15” using a different pagination. CES22 uses it in 8.4(2).

Write `M = Z_ℌ(𝔖)/𝔖`, over a henselian DVR `O` with fraction field `K`
and residue field `k`. The printed argument invokes anisotropy of `M_k` to
conclude `M(O) = M(K)`. The omitted step is anisotropy of `M_K`.

A proper `K`-parabolic would extend over `O` by properness of the appropriate
fixed-type parabolic scheme and specialize to a proper `k`-parabolic. This
contradicts special-fiber anisotropy. One must also rule out a split central
torus: let `T = rad(M)`, choose a finite Galois splitting extension of `k`,
and lift it to the corresponding finite étale extension of `O`. The
character-lattice descriptions identify the cocharacter groups over `K`,
`O` and `k`. Since the last group vanishes, `T_K` is anisotropic too.
Together these statements establish generic anisotropy, and Guo's
Proposition 6 then gives `M(O) = M(K)`.

The singleton comparison of parabolic sets in the erratum counts the whole
group as a parabolic. It does not assert that reduction is injective for an
arbitrary smooth proper scheme. The other correction replaces the cited
Borel–Tits Proposition 6.11 by **Corollaire 6.8** for the split-torus
contribution to the elementary subgroup.

**Known correction:** [Gille, *Errata et compléments*](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf),
dated 26 May 2026, p.4, with references on p.5, attributes this to A. Zidani.
Both points are preserved under E3. The field is not required to have finite
or perfect residue field. The factorization statement remains unchanged.

## E4 — total isotropy is local, whereas the proof chooses a global parabolic

**Locator:** Proposition 8.4, proof of claim (2), author/arXiv v7 p.25,
published p.24. The proof infers a proper parabolic over the semilocal base
from Definition 8.1. That definition supplies parabolics over local rings;
it does not ensure compatible types at different maximal ideals.

The earlier extraction's counterexample makes the incompatibility explicit.
Let `Ō` be the semilocal ring of `A¹_Q` at two closed points with residue
fields a cyclic cubic extension `L₁` and `L₂ = Q(i)`. Set

`R = { f ∈ Ō : f(q₁) ∈ Q and f(q₂) ∈ Q }`.

With `I = q₁q₂Ō`, this is the fiber product
`Ō ×_(L₁×L₂) (Q×Q)`. The ring `Ō` is finite over `R`, and the
finite-extension Noetherian descent theorem shows that `R` is Noetherian.
It is a one-dimensional semilocal domain with the two residue fields `Q`.

Choose a cubic division algebra `D/Q` split by `L₁` and the quaternion
algebra `H = (−1,−1)_Q`, split by `L₂`. For a concrete cubic choice take
`L₁ = Q(ζ₇+ζ₇⁻¹)`, generated by a root of `x³+x²−2x−1`, and
`D = (L₁/Q, σ, 2)`. The prime 2 is inert, so valuations show that 2 is
not a norm; this cyclic algebra has index 3. Milnor patching of `M₆(Ō)`
with `M₂(D)` and `M₃(H)` across the residue maps produces a degree-six
Azumaya `R`-algebra `A`, split generically. The patching also produces
local degree-three and degree-two algebras `D′` and `H′` with

`A_(m₁) ≅ M₂(D′)`, `A_(m₂) ≅ M₃(H′)`.

To see the compatibility in these local decompositions, patch the smaller
matrix algebra over the localized normalization with `D`, respectively
`H`. A difference between the two splitting identifications over `L_i` is
inner, and the conjugating invertible matrix lifts from `L_i` to the local
normalization. Thus their matrix enlargements give the same local patch.
The local matrix factors yield proper parabolics; the only remaining prime
is generic and the algebra is split there. Hence `SL₁(A)` is totally
isotropic and simply connected of type `A₅`.

A global parabolic would have a constant nonempty proper flag type, since
the base is connected and this inner form has constant Dynkin diagram.
At `m₁` its possible reduced dimensions are `{3}`; at `m₂` they are
`{2,4}`. These sets have no common dimension, so no such global parabolic
exists. This refutes the inference in the proof, not the proposition itself.

**Known correction and sufficient repair:** the author's later
[survey v4](https://arxiv.org/pdf/2201.06424v4), p.26, explicitly cites
CES22's proof of 8.4 and corrects the semilocal claim in footnotes to Lemma
3.5.5 and Remark 3.5.6. Strengthen total isotropy by requiring each simple
factor over its own finite étale base to contain `G_m`, hence a fiberwise
proper parabolic. The [current author survey](https://webusers.imj-prg.fr/~kestutis.cesnavicius/torsors-regular.pdf)
has the same correction on pp.24–25. Theorem 9.1 applies 8.4 to a quasi-split
group, which has the required Borel; this issue does not obstruct that use.

### Repair preserving the original hypothesis

The extraction additionally proposes lifting one maximal ideal at a time.
Its full text is retained as `priorExtractionRepair` in the JSON. Its
Noetherian/nonzerodivisor argument needs care: the spreading element need
not remain a nonzerodivisor, and merely taking a power *at least* the
largest denominator exponent does not ensure identity at the other
maximal ideals. The following finite-presentation argument supplies both
points and also works without a Noetherian reduction.

**Polynomial dilation lemma.** Let `G` be an affine group of finite
presentation over `R`, and let
`φ : A^d_(R_s) → G_(R_s)` satisfy `φ(0)=1`.
There is an integer `N>0` and a morphism `ψ : A^d_R → G` such that
`ψ_(R_s)(x)=φ(s^N x)` and `ψ` modulo `s` is the constant identity map.

Embed `G` into a finite affine space using finitely many algebra generators,
and denote the identity coordinates by `e_j`. Each coordinate polynomial
of `φ` has constant term `e_j` in `R_s`. After replacing `x` by `s^a x`
for sufficiently large `a`, choose lifts `c_j(x) ∈ R[x]` with constant
term exactly `e_j` and every nonconstant coefficient divisible by `s`.
This is possible by taking `a` strictly larger than all denominator
exponents. Let `F_1,…,F_r` be defining relations for `G`.

Each `F_i(c(x))` becomes zero in `R_s[x]`, so its finitely many coefficients
are annihilated by a common power `s^b`. Its constant coefficient is
already zero in `R`, since `e` is the identity. Replacing `x` once more by
`s^b x` therefore kills every coefficient: a positive-degree monomial
acquires at least `s^b`. Thus the polynomials `c_j(s^b x)` satisfy all
relations over `R` and define `ψ`, with `N=a+b`. Their nonconstant
coefficients still lie in `sR`. No injectivity of `R → R_s` was used.

Now fix a maximal ideal `m`. Choose a proper parabolic and an opposite
over `R_m`. Their unipotent radicals are affine spaces as schemes; arrange
the parameterizations to send zero to the identity. Spread each
parameterization over `R_f`, with `f ∉ m`. Choose
`s ∈ fR`, outside `m` and inside every other maximal ideal, by the Chinese
remainder theorem. Restrict to `R_s` and apply the lemma. For any specified
point of a radical over `k_m((t))`, lift its affine coordinates, multiplied
by `s^(−N)` in that residue field, to `R((t))`. Such lifts exist
coefficient by coefficient, with a common finite lower bound on powers
of `t`. Evaluating `ψ` gives the desired point at `m` and the identity at
every other residue field.

By the corrected Whitehead factorization in E3 and opposite-radical
generation, every desired loop coset has a finite word representative in
these radical points. Multiply their lifts, separately for the finitely
many maximal ideals. This gives precisely the surjectivity in claim (2).
This is a supplied mathematical repair, not a quotation from the paper or
a Lean formalization. Together with the paper's other steps it preserves
the original scope of Proposition 8.4.

## E5 — a missing residue-field subscript

**Locator:** final sentence of Proposition 8.4 proof; author p.25,
arXiv v7 p.26, published p.24. In the product of Laurent-series fields,
replace `∏_m k((t))` by `∏_m k_m((t))`. There is no single field `k`
defined there. The preceding displays consistently use the residue field
at each maximal ideal. Surjectivity follows by the Chinese remainder theorem
on each coefficient, with a common finite lower bound for the Laurent
series because there are finitely many maximal ideals.

This is a misprint and changes no mathematical assertion as intended.
No correction was located in the searches above.

## E6 — the splitting lands in automorphisms preserving the Borel

**Locator:** Theorem 9.5 proof; author/arXiv v7 p.28, published p.26.
Replace `y ∈ H¹(R, Out(G,B))` by `y ∈ H¹(R, Aut(G,B))`.

The displayed split exact sequence is
`1 → B^ad → Aut(G,B) → Out(G) → 1`.
The class `y` is obtained by applying its section to the outer class.
Thus its target must be `H¹(R,Aut(G,B))`, and this is exactly the
Borel-preserving automorphism torsor needed to twist the subsequent diagram.
`Out(G,B)` is not defined. This is a misprint, with no effect on the theorem
or intended proof. No correction was located in the searches above.

## E7 — arbitrary inner forms are broader than the pure twists needed here

**Locator:** Corollary 9.6 proof, first sentence; author/arXiv v7 p.28,
published p.27. The assertion that every inner form of `SO_n` is `SO(E)`
is false in even rank. Inner twisting by the adjoint group permits algebras
with orthogonal involution whose underlying algebra is not split.

Retain the earlier counterexample over `Q`, which is allowed by taking
`O=R=Q` in Theorem 9.1. Let

`H=(−1,−1)_Q`, `H′=(−1,3)_Q`.

Their ramification sets are `{2,∞}` and `{2,3}`, so they are not isomorphic.
With their canonical symplectic involutions, the tensor product has an
orthogonal involution. Its connected special orthogonal group is the inner
form of split `SO₄`

`(SL₁(H) × SL₁(H′))/μ₂`,

where the quotient is by the diagonal central subgroup. If this were
`SO(E)` for a four-dimensional quadratic space, its inner type would
force trivial discriminant. The two quaternion components of the even
Clifford algebra of such a space are isomorphic. Equivalently its spin
cover has two isomorphic `SL₁(C)` factors. The displayed pair does not.

There is also a direct real-place check: `H` stays Hamiltonian while `H′`
splits, so the Lie algebra has one compact and one split simple factor,
`su(2) ⊕ sl₂(R)`. A real four-dimensional quadratic form gives either
`so(4)` (two compact factors), `so(2,2)` (two split factors), or `so(3,1)`
(real simple), never this mixed pair. Consequently it cannot be `SO(E)`
over `Q` either.

The correct statement needed by the proof is narrower: **a twist by an
`SO_n`-torsor is `SO(E)`**. Descent along the defining representation
produces the quadratic space `E` and its orientation. These pure inner
twists are exactly the ones used when translating injectivity of pointed
cohomology sets into kernel triviality for all twists. The subsequent
orthogonal-torsor and cancellation argument therefore remains valid.
The obstruction above is an even-rank phenomenon; for odd rank the usual
inner forms are represented by quadratic spaces. No existing correction
of this wording was located in the recorded searches.

## E8 — a digit missing from a bibliographic identifier

**Locator:** published p.27, bibliography entry [BFFP20], checked in the
rendered page image. The standalone text gives `arXiv:1911.0766v2`;
it should give **`arXiv:1911.07666v2`**. The adjacent URL in that same
entry already has the correct identifier. The
[versioned arXiv record](https://arxiv.org/abs/1911.07666v2) confirms the
authors Bayer-Fluckiger, First and Parimala, the title *On the
Grothendieck–Serre Conjecture for Classical Groups*, and the v2 date
29 July 2020. The author copy and CES22 arXiv v7 bibliography p.29 also
have the correct URL. This is a publication-specific citation misprint,
not a change to the mathematics. No separate correction notice was
located; the correct author-version entry is not evidence of when a
conscious correction was made.

## Validation and limits

The counterexample arguments above are mathematical arguments, not inferred
from numerical testing. Small diagnostics additionally checked first-order
Taylor expansion in characteristics 2, 3, 5, 7 and 11; the disjoint parabolic
flag types; the cubic polynomial modulo 2; and the two quaternion Hilbert
symbol patterns. For the dilation argument a zero-divisor control over
`Z/6` used the matrix `[[1,x],[0,1+3x]]`: its determinant becomes 1 after
inverting 2, and substitution `x↦2x` makes it 1 already over `Z/6`, while
the matrix becomes the identity modulo 2. This explicitly tests the reason
that a second dilation can be necessary.

`check_errata.py` and the intake file checks are the submission validators.
There is no Lean deliverable for this issue, and no Lean compilation or
formal verification is claimed. All eight findings await the independent
errata review; none has a worker-written `review` verdict.

## Independent review (`REV-ERRATA-PAPER-CESNAVICIUS-22`, issue #1863)

Claude Code, session `cc-fb70e5`, 23 September 2026. **All eight findings are
confirmed**; none is rejected, none is added, and no kind, locator, `printed`,
`correction` or `affects` is changed. The per-finding verdicts are in the JSON
beside this file, and
[the review](../reviews/REV-ERRATA-PAPER-CESNAVICIUS-22.md) records what was
read and how. Every recorded source hash was re-downloaded and matched byte for
byte, except the publisher copy, whose dated footer makes its hash
retrieval-specific, as this record already says; its text agrees at every
locator.

Three points gained something in review. **E1**'s counterexample was checked
and it strengthens the author's own footnote from "a priori not an isomorphism
of `k_m`-schemes" to a genuine failure: in `O/I_z² = k_m[t]/((t^p − s)²)` the
`p`-th powers are `h(s) + h′(s)u` for `h ∈ k_m^p[X]`, and expanding in the
`k_m^p`-basis `1, s, …, s^{p−1}` shows `h(s) = s` forces `h′(s) = 1`, so no
element has `p`-th power `s` and there is no `k_m`-algebra map
`k_z → O/I_z²` whatever. **E5** was settled at the level of font runs rather
than extracted text: the `𝔪` in that sentence belongs to the product sign and
the following `k` is full size, while the display two lines above prints
`k_𝔪((t))` correctly — the same page carries both. **E3** is confirmed as a
gap, and Gille's errata of 26 May 2026 supplies exactly the repair recorded
here, but the final sentence of that correction, replacing the Borel–Tits
reference « prop. 6.11 » by « Corollaire 6.8 », is **not** covered by Gille's
errata and could not be checked: [7] is Borel–Tits, *Homomorphismes
« abstraits » de groupes algébriques simples*, Ann. of Math. 97 (1973), which
is not publicly accessible, and the swap cannot refer to the 1965 *Groupes
réductifs*, whose 6.8 is a proposition on the restriction `X*(T) → X*(S)`.
Treat that one reference repair as a suggestion until someone reads the 1973
paper.
